//
//  ActiveWorkoutView4.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 28/01/2025.
//

import SwiftUI

struct ActiveWorkoutView4: View {
    @State private var selectedExercises: [ExerciseDataModel] = []
    @State private var showSelectExerciseView = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Workout Summary Section
                HStack {
                    VStack(alignment: .leading) {
                        Text("Active Workout")
                            .font(.title2).bold()
                        Text("\(selectedExercises.count) Exercises")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: { /* Logic to end workout */ }) {
                        Text("Finish")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Exercise List
                List {
                    ForEach(selectedExercises) { exercise in
                        ExerciseTrackingRow(exercise: exercise)
                    }
                    .onDelete(perform: removeExercise)
                }
                
                Spacer()
                
                // Add Exercise Button
                Button(action: { showSelectExerciseView = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                        Text("Add Exercise")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                .sheet(isPresented: $showSelectExerciseView) {
                    SelectExerciseView3(selectedExercises: $selectedExercises)
                }
            }
            .navigationTitle("Active Workout")
        }
    }
    
    // Remove Exercise Function
    private func removeExercise(at offsets: IndexSet) {
        selectedExercises.remove(atOffsets: offsets)
    }
}

// Exercise Tracking Row
struct ExerciseTrackingRow: View {
    let exercise: ExerciseDataModel
    @State private var sets: [WorkoutSet] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.name)
                .font(.headline)
            Text(exercise.muscleGroup)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            ForEach(sets.indices, id: \..self) { index in
                SetTrackingRow(set: $sets[index])
            }
            
            Button(action: {
                sets.append(WorkoutSet(reps: 10, weight: 0.0))
            }) {
                HStack {
                    Image(systemName: "plus.circle")
                    Text("Add Set")
                }
                .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 8)
    }
}

// Set Tracking Row
struct SetTrackingRow: View {
    @Binding var set: WorkoutSet
    
    var body: some View {
        HStack {
            TextField("Reps", value: $set.reps, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            TextField("Weight (kg)", value: $set.weight, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
        }
    }
}

// Workout Set Model
struct WorkoutSet: Identifiable {
    let id = UUID()
    var reps: Int
    var weight: Double
}

#Preview {
    ActiveWorkoutView4()
}
