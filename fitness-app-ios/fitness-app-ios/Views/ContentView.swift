//
//  ContentView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 24/10/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @State private var isWorkoutActive: Bool = false

    var body: some View {
        ZStack {
            // Main TabView
            TabView {
//                FeedView()
//                    .tabItem {
//                        Image(systemName: "house")
//                        Text("Feed")
//                    }
//
//                CommunitiesView()
//                    .tabItem {
//                        Image(systemName: "person.3")
//                        Text("Communities")
//                    }

                ExerciseView2(isWorkoutActive: $isWorkoutActive)
                    .tabItem {
                        Image(systemName: "dumbbell")
                        Text("Activity")
                    }

                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }

                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }

            // Overlay the Active Workout View if a workout is active
            if isWorkoutActive {
                VStack {
                    Spacer()
                    ActiveWorkoutOverlay(isWorkoutActive: $isWorkoutActive)
                        .padding(.bottom, 50) // Keep the overlay above the TabView
                        .transition(.move(edge: .bottom))
                        .animation(.spring(), value: isWorkoutActive)
                }
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
