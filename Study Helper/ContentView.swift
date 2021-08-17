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
    
    func courses() -> [Course?] {
        let courseStore = CDCourseStore(context: viewContext)
        let result = courseStore.getCourses()
        
        switch result {
        case .success(let courses):
            return courses
        case .failure(let error):
            print(error)
        }
        
        return []
    }
    
    func createCourse() -> Bool {
        let courseStore = CDCourseStore(context: viewContext)
        let course = Course(id: "1", name: "test", courseColor: "blue", courseImage: URL(string: "https://www.test.com"), totalSeconds: 22.2)
        let result = courseStore.create(course: course)
        
        switch result {
        case .success:
            courseStore.save()
            return true
        case .failure:
            return false
        }
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                createCourse()
                print(courses())
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
