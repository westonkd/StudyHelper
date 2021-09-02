//
//  Domain.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/18/21.
//

import Foundation
import CoreData

protocol DomainModel {
    associatedtype Model: DomainModel
    
    static func PreviewData() -> [Model]
    static func all() -> [Model]
    func save() -> Bool
    // TODO: What other methods make sense here? What should the interface look like?
}
