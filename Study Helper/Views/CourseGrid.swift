//
//  CourseGrid.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/19/21.
//

import SwiftUI

struct CourseGrid: View {
    @Binding var courses: [Course]
    
    var columns: [GridItem] {
        Array(repeating: .init(.flexible()), count: 2)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0..<courses.count) { courseIndex in
                    CourseButton(course: $courses[courseIndex])
                }
            }
            .padding(10)
        }
    }
}

struct CourseGrid_Previews: PreviewProvider {
    static var previews: some View {
        CourseGrid(courses: .constant(Course.PreviewData()))
    }
}
