//
//  File.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/15/21.
//

import Foundation

/// Protocol for a data store. Could be CoreData, API, etc.
protocol DataStore {
    associatedtype Entity
    
    func get() -> Result<[Entity], Error>
    func create() -> Result<Entity, Error>
}
