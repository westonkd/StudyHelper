//
//  CourseButton.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/19/21.
//

import SwiftUI

struct CourseButton: View {
    @Binding var course: Course
    
    var body: some View {
        Button(action: { print("Button action") }) {
            ZStack(alignment: .top) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(course.name)
                            .font(.headline)
                        Text("Button")
                            .font(.subheadline)
                    }
                    .frame(height: 75)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: { print("more") }) {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.system(size: 20.0))
                    }
                }
            }
        }
        .padding(10)
        .foregroundColor(.white)
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct CourseButton_Previews: PreviewProvider {
    static var previews: some View {
        CourseButton(course: .constant(Course.PreviewData()[0]))
    }
}
