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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
