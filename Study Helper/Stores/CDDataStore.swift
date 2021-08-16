//
//  CDDataStore.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/15/21.
//

import Foundation
import CoreData

enum CDError: Error {
    // Indicates the associated type was not found
    // in the data model
    case invalidManagedObjectType
}


class CDDataStore<T: NSManagedObject>: DataStore {
    typealias Entity = T
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func get() -> Result<[Entity], Error> {
        let fetchRequest = Entity.fetchRequest()
        
        // TODO: allow setting predicates and sort descripors
        
        do {
            if let result = try context.fetch(fetchRequest) as? [Entity] {
                return .success(result)
            } else {
                return .failure(CDError.invalidManagedObjectType)
            }
        } catch {
            return .failure(error)
        }
    }
    
    func create() -> Result<Entity, Error> {
        let className = String(describing: Entity.self)
        guard let managedObject = NSEntityDescription.insertNewObject(forEntityName: className, into: context) as? Entity else {
            return .failure(CDError.invalidManagedObjectType)
        }
        return .success(managedObject)
    }
}
