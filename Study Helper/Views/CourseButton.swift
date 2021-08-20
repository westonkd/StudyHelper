//
//  CourseButton.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/19/21.
//

import SwiftUI

struct CourseButton: View {
    @Binding var course: Course
    @Binding var activeCourseId: String
    
    var body: some View {
        Button(action: { print("Start/Stop Course Timer") }) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(course.name)
                        .font(.headline)
                    // How long the current timer has been running.
                    // What should it be if no timer is running for the course?
                    Text("00:12:20")
                        .font(.subheadline)
                        .padding(.top, 5)
                }
                Spacer()
                Button(action: { print("Detailed Course Viw") }) {
                    Image(systemName: "ellipsis.circle.fill")
                        .font(.system(size: 20.0))
                }
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .foregroundColor(.white)
        .background(Color.init(hex: course.courseColor))
        .cornerRadius(10)
        .overlay(
            course.id == activeCourseId ? RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.label), lineWidth: 3) : nil
        )
    }
}

struct CourseButton_Previews: PreviewProvider {
    static var previews: some View {
        CourseButton(
            course: .constant(Course.PreviewData()[4]),
            activeCourseId: .constant("2")
        )
    }
}
