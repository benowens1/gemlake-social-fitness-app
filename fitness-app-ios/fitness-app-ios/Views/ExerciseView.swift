//
//  WorkoutView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 24/10/2024.
//

import SwiftUI

struct ExerciseView: View {
    var body: some View {
        NavigationView {
            List {
                // Quick Start Section
                Section(header: Text("Quick Start")) {
                    Button(action: {
                        // Placeholder action for starting a new workout
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.black)
                                .font(.title2)
                            Text("Start Workout")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }
                    
                    Button(action: {
                        // Placeholder action for starting a new activity
                    }) {
                        HStack {
                            Image(systemName: "plus.viewfinder")
                                .foregroundColor(.black)
                                .font(.title2)
                            Text("Start Activity")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }
                    
                }
                

                // Routines Section
                Section(header: Text("Routines")) {
                    Button(action: {
                        // Placeholder action for creating a new routine
                    }) {
                        HStack {
                            Image(systemName: "rectangle.stack.fill.badge.plus")
                                .foregroundColor(.black)
                                .font(.title2)
                            Text("Create New Routine")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }
                }

                // Exercises Section
                Section(header: Text("Exercises")) {
                    Button(action: {
                        // Placeholder action for adding a new exercise
                    }) {
                        HStack {
                            Image(systemName: "figure.strengthtraining.traditional")
                                .foregroundColor(.black)
                                .font(.title2)
                            Text("New Exercise")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }

                    NavigationLink(destination: ListExercisesView2()) {
                        HStack {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                                .font(.title2)
                            Text("List Exercises")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }
                }

                // My Workouts Section
                Section(header: Text("My Workouts")) {
                    ForEach(0..<3) { index in
                        NavigationLink(destination: Text("Workout Detail View")) {
                            WorkoutRowView(workoutName: "Workout \(index + 1)")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Workouts")
        }
    }
}

struct WorkoutRowView: View {
    let workoutName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(workoutName)
                    .font(.headline)
                Text("Summary of exercises")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
            Button(action: {
                // Placeholder for starting the workout
            }) {
                Text("Start Workout")
                    .font(.subheadline)
                    .padding(6)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding(.vertical, 4)
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}

#Preview {
    ExerciseView()
}
