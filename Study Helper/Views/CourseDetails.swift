//
//  SwiftUIView.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/25/21.
//

import SwiftUI

struct CourseDetails: View {
    @Binding var course: Course?
    
    var body: some View {
        HStack {
            Text("Course details here")
        }
        .navigationTitle(course?.name ?? "")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetails(course: .constant(Course.PreviewData()[1]))
    }
}
