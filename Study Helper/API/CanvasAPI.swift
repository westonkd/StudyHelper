//
//  CanvasAPI.swift
//  Study Helper
//
//  Created by Nate Armstrong on 9/2/21.
//

import Foundation

class CanvasAPI: API {
    func getCourses(callback: @escaping (Result<[Course], Error>) -> Void) {
        return get("courses", callback: callback)
    }

    private func get<T>(_ path: String, callback: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: "https://wdransfield.instructure.com/api/v1/\(path)")!) { data, _, error in
            guard let data = data, error != nil else {
                callback(.failure(error!))
                return
            }
            let decoder = JSONDecoder()
            do {
                let models = try decoder.decode(T.self, from: data)
                callback(.success(models))
            } catch {
                callback(.failure(error))
            }
        }
        task.resume()
    }
}
