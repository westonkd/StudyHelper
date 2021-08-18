//
//  CDCourse+CoreDataClass.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/14/21.
//
//

import Foundation
import CoreData


public class CDCourse: NSManagedObject, Domainable {
    typealias Model = Course
    
    func toDomain() -> Course {
        return Course(
            // TODO: Better defaults (or DB validation to make sure they are set)
            id: self.id ?? "",
            name: self.name ?? "",
            courseColor: self.courseColor ?? "",
            courseImage: self.courseImage,
            totalSeconds: self.totalSeconds
        )
    }
}
