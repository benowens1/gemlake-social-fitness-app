////
////  ActiveWorkoutView.swift
////  fitness-app-ios
////
////  Created by Ben Owens on 06/01/2025.
////
//
//import SwiftUI
//
//struct ActiveWorkoutView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var workoutDuration: Int = 0 // Timer in seconds
//    @State private var timer: Timer? // Timer object
//
//    @State private var selectedExercises: [ExerciseData] = [] // Exercises added by the user
//    @State private var showSelectExerciseView = false // Show the SelectExerciseView
//
//    var body: some View {
//        VStack {
//            
//            HStack {
//                Text("Log Workout")
//                    .bold()
//                    .padding()
//                
//                Spacer()
//                
//                Button(action: {
//                    stopTimer()
//                    dismiss() // Dismiss the view
//                }) {
//                    Text("Finish")
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                        .padding(.horizontal)
//                }
//            }
//            .padding(.vertical)
//            
//            Divider()
//            
//            HStack {
//                Text(formattedTime)
//                Spacer()
//                Text("Volume")
//                Spacer()
//                Text("Sets")
//            }
//            .padding()
//            
//            
//            // Exercise List
//            if selectedExercises.isEmpty {
//                Text("No exercises added yet.")
//                    .foregroundColor(.gray)
//                    .padding()
//            } else {
//                List(selectedExercises) { exercise in
//                    HStack {
//                        Text(exercise.name)
//                            .font(.headline)
//                        Spacer()
//                        Text(exercise.muscleGroup)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                }
//                .listStyle(InsetGroupedListStyle())
//            }
//            
//            Spacer()
//            
//            // "Add Exercise" Button
//            Button(action: {
//                showSelectExerciseView = true
//            }) {
//                Text("Add Exercises")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//                    .padding(.horizontal)
//            }
//            .sheet(isPresented: $showSelectExerciseView) {
//                SelectExerciseView(selectedExercises: $selectedExercises)
//            }
//            
//            
//            HStack {
//                // Settings Button
//                Button(action: {
//                    
//                }) {
//                    Text("Settings")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color(.systemGray5))
//                        .foregroundColor(.primary)
//                        .cornerRadius(8)
//                }
//                
//                // End Workout Button
//                Button(action: {
//                    stopTimer()
//                    dismiss() // Dismiss the view
//                }) {
//                    Text("End Workout")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color(.systemGray5))
//                        .foregroundColor(.red)
//                        .cornerRadius(8)
//                }
//            }
//            .padding(.horizontal)
//            
//            
//        }
//        .onAppear {
//            startTimer()
//        }
//        .onDisappear {
//            stopTimer()
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
//    ActiveWorkoutView()
//}
