////
////  ActiveWorkoutView2.swift
////  fitness-app-ios
////
////  Created by Ben Owens on 07/01/2025.
////
//
//import SwiftUI
//
//struct ActiveWorkoutView2: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var workoutDuration: Int = 0 // Timer in seconds
//    @State private var timer: Timer? // Timer object
//
//    @State private var selectedExercises: [ExerciseData] = [] // Exercises added by the user
//    @State private var showSelectExerciseView = false // Show the SelectExerciseView
//    
//    @State private var showEndWorkoutAlert = false // Add confirmation alert for end workout
//    @State private var showWorkoutSettingsView = false
//
//    var body: some View {
//        NavigationView {
//            List {
//                // Section: Workout Info (Timer, Volume, Sets)
//                Section {
//                    HStack {
//                        Text("Time:")
//                        Spacer()
//                        Text(formattedTime)
//                    }
//                    HStack {
//                        Text("Volume:")
//                        Spacer()
//                        Text("0 kg") // Placeholder for now
//                    }
//                    HStack {
//                        Text("Sets:")
//                        Spacer()
//                        Text("\(selectedExercises.count) sets") // Placeholder for now
//                    }
//                }
//
//                // Section: Exercises in workout
//                Section(header: Text("Exercises")) {
//                    if selectedExercises.isEmpty {
//                        Text("Add an exercise to begin your workout")
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
//                // Section: Add Exercise, Settings, and End Workout Buttons
//                Section {
//                    // Add Exercises List Item
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
//                        SelectExerciseView2(selectedExercises: $selectedExercises)
//                    }
//                    
//                    // Settings List Item
//                    Button(action: {
//                        showWorkoutSettingsView = true
//                    }) {
//                        HStack {
//                            Text("Settings")
//                                .foregroundColor(.primary)
//                            Spacer()
//                            Image(systemName: "gear")
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    .sheet(isPresented: $showWorkoutSettingsView) {
//                        WorkoutSettingsView()
//                    }
//
//                    // End Workout List Item
//                    Button(action: {
//                        showEndWorkoutAlert = true
//                    }) {
//                        HStack {
//                            Text("End Workout")
//                                .foregroundColor(.red)
//                            Spacer()
//                            Image(systemName: "xmark.circle.fill")
//                                .foregroundColor(.red)
//                        }
//                    }
//                    .alert(isPresented: $showEndWorkoutAlert) {
//                        Alert(
//                            title: Text("End Workout"),
//                            message: Text("Are you sure you want to end this workout?"),
//                            primaryButton: .destructive(Text("End Workout")) {
//                                stopTimer()
//                                dismiss() // End the workout
//                            },
//                            secondaryButton: .cancel()
//                        )
//                    }
//                }
//            }
//            .navigationTitle("Log Workout")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        stopTimer()
//                        dismiss() // End the workout
//                    }) {
//                        Text("Finish")
//                            .foregroundColor(.green)
//                    }
//                }
//            }
//            .onAppear {
//                startTimer()
//            }
//            .onDisappear {
//                stopTimer()
//            }
//        }
//    }
//
//    // Timer Logic
//    private func startTimer() {
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//            workoutDuration += 1
//        }
//    }
//
//    private func stopTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
//
//    // Formatted Time
//    private var formattedTime: String {
//        let minutes = workoutDuration / 60
//        let seconds = workoutDuration % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
//
//#Preview {
//    ActiveWorkoutView2()
//}
