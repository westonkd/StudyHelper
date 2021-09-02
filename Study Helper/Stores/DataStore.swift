//
//  File.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/15/21.
//

import Foundation

/// Protocol for objects describing a predicate
struct Predicate {
    let format: String
    let arguments: [Any]?
}

/// Protocol for objects describing a sort
struct SortDescriptor {
    let key: String
    let ascending: Bool = true
}

/// Protocol for a data store. Could be CoreData, API, etc.
protocol DataStore {
    associatedtype Entity
    
    func get(predicate: Predicate?, sortDescriptor: SortDescriptor?) -> Result<[Entity], Error>
    func create() -> Result<Entity, Error>
    func save() -> Result<Bool, Error>
}
