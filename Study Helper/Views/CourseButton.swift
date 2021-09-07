//
//  CourseButton.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/19/21.
//

import SwiftUI

struct CourseButton: View {
    enum Shadow: CGFloat {
        case none = 0
        case small = 5
        case large = 10
    }
    
    @Binding var course: Course
    @State var shadowRadius = Shadow.none
    @State var showBorder = false
    @State var scaleValue = CGFloat(1)
    
    var isActiveCourse: Bool
    var onPress: (_ c: Course) -> Void
    
    var body: some View {
        ZStack {
            Button(action: {
                print("start/stop timer")
            }) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(course.name)
                            .font(.headline)
                        Text("00:12:20")
                            .font(.subheadline)
                            .padding(.top, 5)
                    }
                    Spacer()
                    Button(action: {
                        onPress(course)
                    }) {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.system(size: 20.0))
                    }
                }
                .gesture(DragGesture(minimumDistance: 0.0)
                            .onChanged { _ in withAnimation(.easeOut(duration: 0.2)) { scaleValue = 1.05 } }
                            .onEnded { _ in withAnimation(.easeIn(duration: 0.2)) {scaleValue = 1} })
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .foregroundColor(.white)
            .background(Color.init(hex: course.courseColor))
            .cornerRadius(10)
            .overlay(
                Group {
                    if showBorder {
                        RoundedRectangle(cornerRadius: 10).stroke(Color.init(hex: course.courseColor).opacity(0.75), lineWidth: 4)
                    }
                }
            )
            .scaleEffect(scaleValue)
            .shadow(radius: shadowRadius.rawValue)
            .onAppear {
                if (!isActiveCourse) {
                    return
                }
                
                shadowRadius = Shadow.small
                
                let anim = Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true)
                withAnimation(anim) {
                    shadowRadius = Shadow.large
                    showBorder = true
                }
            }
        }
    }
}

struct CourseButton_Previews: PreviewProvider {
    static var previews: some View {
        CourseButton(
            course: .constant(Course.PreviewData()[0]),
            isActiveCourse: false,
            onPress: { (c: Course) -> Void in
                print("Clicked \(c.name)")
            }
        )
    }
}
