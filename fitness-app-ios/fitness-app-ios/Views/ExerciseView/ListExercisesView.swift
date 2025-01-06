//
//  ListExercisesView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 03/11/2024.
//

import SwiftUI

struct ListExercisesView: View {
    @State private var selectedEquipment: String = "All Equipment"
    @State private var selectedMuscleGroup: String = "All Muscles"
    @State private var searchText: String = ""

    // Sample exercises for initial display
    private let sampleExercises = [
        ExerciseData(name: "Bench Press", equipment: "Barbell", muscleGroup: "Chest"),
        ExerciseData(name: "Bicep Curl", equipment: "Dumbbell", muscleGroup: "Biceps"),
        ExerciseData(name: "Tricep Pushdown", equipment: "Cable", muscleGroup: "Triceps"),
        ExerciseData(name: "Leg Extension", equipment: "Machine", muscleGroup: "Quadriceps"),
        ExerciseData(name: "Lat Pulldown", equipment: "Cable", muscleGroup: "Back")
    ]
    
    private var equipmentOptions = ["All Equipment", "Dumbbell", "Barbell", "Cable", "Machine"]
    private var muscleGroupOptions = ["All Muscles", "Chest", "Biceps", "Triceps", "Back", "Quadriceps"]

    // Filtered exercises based on selected filters and search text
    var filteredExercises: [ExerciseData] {
        sampleExercises.filter { exercise in
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
                    List(filteredExercises, id: \.name) { exercise in
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
            }
            .navigationTitle("List of Exercises")
        }
    }
}

// Struct for sample exercise data
struct ExerciseData {
    let name: String
    let equipment: String
    let muscleGroup: String
}

#Preview {
    ListExercisesView()
}
