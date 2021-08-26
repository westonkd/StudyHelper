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
    
    @State private var action: Int? = 0
    
    // The course currently being timed
    @State var activeCourse: Course?
    
    // The cousre being inspected
    @State var inspectedCourse: Course?
    
    // Indicates if the user is inspecting a course
    @State var isInspecting: Bool? = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(destination: CourseDetails(course: $inspectedCourse), tag: true, selection: $isInspecting) {
                    EmptyView()
                }
                
                LazyVGrid(columns: columns) {
                    ForEach(0..<courses.count) { courseIndex in
                        CourseButton(
                            course: $courses[courseIndex],
                            activeCourse: $activeCourse,
                            onPress: { (c: Course) -> Void in
                                inspectedCourse = c
                                isInspecting = true
                            }
                        )
                    }
                }
                .padding(10)
            }
            .navigationTitle("Courses")
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
