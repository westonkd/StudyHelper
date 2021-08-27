//
//  SwiftUIView.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/25/21.
//

import SwiftUI

struct CourseDetails: View {
    @Binding var course: Course?
    @Binding var running: Bool
    
    var iconName: String {
        return running ? "pause.circle.fill" : "play.circle.fill"
    }
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Image(systemName: iconName)
                    .font(.system(size: 100.0))
            }
            
            if running {
                Text("00:00:00")
                    .font(.system(size: 35))
                    .padding(.top, 20)
            }
            
            VStack {
                Divider()
                Text("Course Event List. Users should be able to swipe up on this to see taller list list")
            }
        }
        .navigationTitle(course?.name ?? "")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetails(
            course: .constant(Course.PreviewData()[1]),
            running: .constant(false)
        )
    }
}
