//
//  CDCourseStore.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/15/21.
//

import Foundation
import CoreData

protocol CourseStore {
    func all() -> Result<[Course], Error>
    func create(course: Course) -> Result<Course, Error>
    func save() -> Result <Bool, Error>
}

class CDCourseStore: CourseStore {
    private let store: CDDataStore<CDCourse>
    
    init(context: NSManagedObjectContext) {
        self.store = CDDataStore<CDCourse>(context: context)
    }
    
    func all() -> Result<[Course], Error> {
        let result = store.get()
        switch result {
        case .success(let managedCourses):
            return .success(
                managedCourses.map { (course: CDCourse) -> Course in
                    course.toDomain()
                }
            )
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func create(course: Course) -> Result<Course, Error> {
        let result = store.create()
        switch result {
        case .success(let managedCourse):
            // TODO: Generalize with reflection?
            managedCourse.id = course.id
            managedCourse.name = course.name
            managedCourse.courseColor = course.courseColor
            managedCourse.courseImage = course.courseImage
            managedCourse.totalSeconds = course.totalSeconds
            
            return .success(course)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    @discardableResult func save() -> Result<Bool, Error> {
        return store.save()
    }
}
