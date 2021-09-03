//
//  API.swift
//  Study Helper
//
//  Created by Nate Armstrong on 9/2/21.
//

import Foundation

protocol API {
    func getCourses(callback: @escaping (Result<[Course], Error>) -> Void)
}
