//
//  CourseGrid.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/19/21.
//

import SwiftUI

struct CourseGrid: View {
    @Binding var courses: [Course]
    @Binding var activeCourseId: String
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible()),
    ]

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0..<courses.count) { courseIndex in
                    CourseButton(
                        course: $courses[courseIndex],
                        activeCourseId: $activeCourseId
                    )
                }
            }
            .padding(10)
        }
    }
}

struct CourseGrid_Previews: PreviewProvider {
    static var previews: some View {
        CourseGrid(
            courses: .constant(Course.PreviewData()),
            activeCourseId: .constant("2")
        )
        .preferredColorScheme(.light)
    }
}
