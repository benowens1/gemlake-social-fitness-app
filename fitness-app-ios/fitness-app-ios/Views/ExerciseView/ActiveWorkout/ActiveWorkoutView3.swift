////
////  ActiveWorkoutView3.swift
////  fitness-app-ios
////
////  Created by Ben Owens on 12/01/2025.
////
//
//import SwiftUI
//import Foundation
//
//struct ActiveWorkoutView3: View {
//    @State private var selectedExercises: [ExerciseDataModel] = []
//    @State private var showSelectExerciseView = false
//
//    var body: some View {
//        NavigationView {
//            List {
//                Section(header: Text("Exercises in Workout")) {
//                    if selectedExercises.isEmpty {
//                        Text("No exercises added yet. Tap 'Add Exercises' to start.")
//                            .foregroundColor(.gray)
//                    } else {
//                        ForEach(selectedExercises) { exercise in
//                            VStack(alignment: .leading) {
//                                Text(exercise.name)
//                                    .font(.headline)
//                                Text(exercise.muscleGroup)
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                    }
//                }
//
//                Section {
//                    Button(action: {
//                        showSelectExerciseView = true
//                    }) {
//                        HStack {
//                            Text("Add Exercises")
//                                .fontWeight(.bold)
//                                .foregroundColor(.primary)
//                            Spacer()
//                            Image(systemName: "plus.circle.fill")
//                                .foregroundColor(.green)
//                        }
//                    }
//                    .sheet(isPresented: $showSelectExerciseView) {
//                        SelectExerciseView3(selectedExercises: $selectedExercises)
//                    }
//                }
//            }
//            .navigationTitle("Active Workout")
//        }
//    }
//}
//
//
//
//#Preview {
//    ActiveWorkoutView3()
//}
