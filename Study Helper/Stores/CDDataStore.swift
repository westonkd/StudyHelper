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

/// Concrete DataStore implementation for CoreData
class CDDataStore<T: NSManagedObject>: DataStore {
    typealias Entity = T
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func get(predicate: Predicate? = nil, sortDescriptor: SortDescriptor? = nil) -> Result<[Entity], Error> {
        let fetchRequest = Entity.fetchRequest()
        
        if let pred = predicate {
            fetchRequest.predicate = pred.toNSPredicate()
        }
        
        // TODO allow setting sort descriptors
        
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
    
    func save() -> Result<Bool, Error> {
        do {
            try context.save()
            return .success(true)
        } catch {
            context.rollback()
            return .failure(error)
        }
    }
}

// Extensions for converting general predicates/sorts to NS
extension Predicate {
    func toNSPredicate() -> NSPredicate {
        return NSPredicate(format: self.format, argumentArray: self.arguments)
    }
}

extension SortDescriptor {
    func toNSSortDescriptor() -> NSSortDescriptor {
        return NSSortDescriptor(key: self.key, ascending: self.ascending)
    }
}
