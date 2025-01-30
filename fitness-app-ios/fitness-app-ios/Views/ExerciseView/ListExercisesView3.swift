//
//  ListExerciseView3.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 12/01/2025.
//

import SwiftUI

struct ListExercisesView3: View {
    @State private var selectedEquipment: String = "All Equipment"
    @State private var selectedMuscleGroup: String = "All Muscles"
    @State private var searchText: String = ""

    // Load exercises from the CSV file
    private let exercises = loadExercisesFromCSV()

    private var equipmentOptions = ["All Equipment"] + ["Dumbbell", "Barbell", "Cable", "Machine", "Plate", "Bodyweight"].sorted(by: <)
    private var muscleGroupOptions = ["All Muscles"] + ["Chest", "Biceps", "Triceps", "Back", "Shoulders", "Quadriceps", "Calves", "Abdominals"].sorted(by: <)

    // Filtered exercises based on selected filters and search text
    var filteredExercises: [ExerciseDataModel] {
        exercises.filter { exercise in
            (selectedEquipment == "All Equipment" || exercise.equipment == selectedEquipment) &&
            (selectedMuscleGroup == "All Muscles" || exercise.muscleGroup == selectedMuscleGroup) &&
            (searchText.isEmpty || exercise.name.localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search exercises...", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                // Filter Section
                HStack {
                    Picker("Equipment", selection: $selectedEquipment) {
                        ForEach(equipmentOptions, id: \.self) { equipment in
                            Text(equipment).tag(equipment)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)

                    Picker("Muscle Group", selection: $selectedMuscleGroup) {
                        ForEach(muscleGroupOptions, id: \.self) { group in
                            Text(group).tag(group)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                }

                // Exercise List
                if filteredExercises.isEmpty {
                    Text("No exercises found.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(filteredExercises, id: \.id) { exercise in
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                                .font(.headline)
                            Text(exercise.muscleGroup)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
                Spacer()
            }
            .navigationTitle("List of Exercises")
        }
    }
}

//// Struct for sample exercise data
//struct ExerciseDataModel: Identifiable {
//    let id = UUID()
//    let name: String
//    let muscleGroup: String
//    let equipment: String
//}

#Preview {
    ListExercisesView3()
}
