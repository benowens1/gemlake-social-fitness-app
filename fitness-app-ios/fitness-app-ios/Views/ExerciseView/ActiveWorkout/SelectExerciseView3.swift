//
//  SelectExerciseView3.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 12/01/2025.
//

import SwiftUI
import Foundation

struct SelectExerciseView3: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedExercises: [ExerciseDataModel]

    private let exercises = loadExercisesFromCSV()

    @State private var selectedExerciseIDs: Set<UUID> = []

    var body: some View {
        NavigationView {
            List {
                ForEach(exercises) { exercise in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                                .font(.headline)
                            Text("\(exercise.muscleGroup) - \(exercise.equipment)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        if selectedExerciseIDs.contains(exercise.id) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleSelection(for: exercise)
                    }
                }
            }
            .navigationTitle("Select Exercises")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        selectedExercises = exercises.filter { selectedExerciseIDs.contains($0.id) }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                selectedExerciseIDs = Set(selectedExercises.map { $0.id })
            }
        }
    }

    private func toggleSelection(for exercise: ExerciseDataModel) {
        if selectedExerciseIDs.contains(exercise.id) {
            selectedExerciseIDs.remove(exercise.id)
        } else {
            selectedExerciseIDs.insert(exercise.id)
        }
    }
}

#Preview {
    SelectExerciseView3(selectedExercises: .constant([]))
}
