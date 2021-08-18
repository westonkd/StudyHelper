//
//  File.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/15/21.
//

import Foundation

/// Indicates the data model can be converted to a domain model
protocol Domainable {
    associatedtype Model: DomainModel
    func toDomain() -> Model
}
