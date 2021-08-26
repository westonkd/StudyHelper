//
//  CourseButton.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/19/21.
//

import SwiftUI

struct CourseButton: View {
    @Binding var course: Course
    @Binding var activeCourse: Course?
    
    var onPress: (_ c: Course) -> Void
    var isActiveCourse: Bool {
        guard let c = activeCourse else {
            return false
        }
        
        return c.id == course.id
    }
    
    var body: some View {
        Button(action: { print("start/stop timer") }) {
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
                Button(action: { onPress(course) }) {
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
            isActiveCourse ? RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.label), lineWidth: 3) : nil
        )
    }
}

struct CourseButton_Previews: PreviewProvider {
    static var previews: some View {
        CourseButton(
            course: .constant(Course.PreviewData()[0]),
            activeCourse: .constant(Course.PreviewData()[1]),
            onPress: { (c: Course) -> Void in
                print("Clicked \(c.name)")
            }
        )
    }
}
