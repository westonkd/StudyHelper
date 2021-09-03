//
//  Course.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/14/21.
//

import Foundation

struct Course: DomainModel {
    typealias Model = Course
    
    let id: String
    let name: String
    let courseColor: String
    let courseImage: URL?
    let totalSeconds: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case courseColor = "course_color"
        case courseImage = "course_image"
        case totalSeconds
    }

    static func all() -> [Course] {
        let courseStore = CDCourseStore(context: PersistenceController.shared.container.viewContext)
        let result = courseStore.all()
        
        switch result {
        case .success(let courses):
            return courses
        case .failure(let error):
            print(error)
        }
        
        return []
    }
    
    @discardableResult func save() -> Bool {
        let courseStore = CDCourseStore(context: PersistenceController.shared.container.viewContext)
        
        // TODO: if the course exists, just update it
        let result = courseStore.create(course: self)
        
        switch result {
        case .success:
            courseStore.save()
            return true
        case .failure:
            return false
        }
    }
}
