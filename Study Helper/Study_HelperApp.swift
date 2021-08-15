//
//  Study_HelperApp.swift
//  Study Helper
//
//  Created by Weston Dransfield on 8/13/21.
//

import SwiftUI

@main
struct Study_HelperApp: App {
    @Environment(\.scenePhase) var scenePhase

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            // Save the managed object context when going to background
            persistenceController.saveContext()
        }
    }
}
