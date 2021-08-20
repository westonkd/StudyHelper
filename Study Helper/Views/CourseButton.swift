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
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(course.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Button")
                        .font(.headline)
                }
                Spacer()
                    .frame(width: 25)
                Button(action: { print("more") }) {
                    Image(systemName: "ellipsis.circle.fill")
                        .font(.system(size: 20.0))
                }
                .padding(.top, 5)
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
