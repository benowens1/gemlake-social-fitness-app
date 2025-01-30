//
//  WorkoutBuilderView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 06/01/2025.
//

import SwiftUI

struct WorkoutBuilderView: View {
    @State private var selectedExercises: [ExerciseDataModel] = []
    @State private var availableExercises: [ExerciseDataModel] = loadExercisesFromCSV()

    var body: some View {
        NavigationView {
            VStack {
                // Header
                Text("Build Your Workout")
                    .font(.title)
                    .bold()
                    .padding()

                // Available exercises list
                List(availableExercises) { exercise in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                                .font(.headline)
                            Text("\(exercise.muscleGroup) · \(exercise.equipment)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            addExerciseToWorkout(exercise)
                        }) {
                            Image(systemName: selectedExercises.contains(where: { $0.id == exercise.id }) ? "checkmark.circle.fill" : "plus.circle")
                                .foregroundColor(selectedExercises.contains(where: { $0.id == exercise.id }) ? .green : .blue)
                                .font(.title2)
                        }
                    }
                }

                // Start button
                Button(action: {
                    // Save the workout or start tracking it
                    print("Workout Started!")
                }) {
                    Text("Start Workout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle("Workout Builder")
        }
    }

    // Function to add exercise to the workout
    private func addExerciseToWorkout(_ exercise: ExerciseDataModel) {
        if let index = selectedExercises.firstIndex(where: { $0.id == exercise.id }) {
            selectedExercises.remove(at: index)
        } else {
            selectedExercises.append(exercise)
        }
    }
}

#Preview {
    WorkoutBuilderView()
}
