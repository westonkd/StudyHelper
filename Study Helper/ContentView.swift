//
//  ContentView.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)
    private var viewContext
    
    var body: some View {
        CourseGrid(
            courses: .constant(Course.PreviewData()),
            activeCourseId: .constant("2")
        )
            .padding()
            .onAppear {
                // Test: Create a course
                Course(id: "1", name: "test", courseColor: "blue", courseImage: URL(string: "https://www.test.com"), totalSeconds: 22.3).save()
                
                // Test: Fetch all courses
                print(Course.all())
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
