//
//  CoursePreviewData.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/19/21.
//

import Foundation

extension Course {
    static func PreviewData() -> [Course] {
        return [
            Course(
                id: "1",
                name: "Computer Security",
                courseColor: "#FFF",
                courseImage: URL(string: "https://via.placeholder.com/150"),
                totalSeconds: 120.1
            ),
            Course(
                id: "2",
                name: "Spanish 101",
                courseColor: "#DF6650",
                courseImage: URL(string: "https://via.placeholder.com/150"),
                totalSeconds: 220.1
            ),
            Course(
                id: "3",
                name: "Linear Algebra",
                courseColor: "#DF702F",
                courseImage: URL(string: "https://via.placeholder.com/150"),
                totalSeconds: 320.1
            ),
            Course(
                id: "4",
                name: "Computational Theory",
                courseColor: "#221A71",
                courseImage: URL(string: "https://via.placeholder.com/150"),
                totalSeconds: 420.1
            ),
            Course(
                id: "5",
                name: "Course with a really, really long name!!!!!!!!!!!",
                courseColor: "#221A71",
                courseImage: URL(string: "https://via.placeholder.com/150"),
                totalSeconds: 420.1
            )
        ]
    }
}
