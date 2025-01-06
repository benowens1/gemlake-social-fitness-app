//
//  fitness_app_iosApp.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 24/10/2024.
//

import SwiftUI

@main
struct fitness_app_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
