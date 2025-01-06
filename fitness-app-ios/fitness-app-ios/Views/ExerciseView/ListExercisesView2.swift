//
//  ListExercisesView2.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 06/01/2025.
//

import SwiftUI

func loadExercisesFromCSV() -> [ExerciseData] {
    guard let path = Bundle.main.path(forResource: "sample_exercises", ofType: "csv") else {
        print("CSV file not found.")
        return []
    }
    
    do {
        let csvData = try String(contentsOfFile: path, encoding: .utf8)
        let rows = csvData.components(separatedBy: "\n").dropFirst() // Skip header row
        return rows.compactMap { row in
            let columns = row.components(separatedBy: ",")
            guard columns.count == 3 else { return nil }
            return ExerciseData(name: columns[0], muscleGroup: columns[1], equipment: columns[2])
        }
    } catch {
        print("Error reading CSV file: \(error)")
        return []
    }
}

struct ListExercisesView2: View {
    @State private var selectedEquipment: String = "All Equipment"
    @State private var selectedMuscleGroup: String = "All Muscles"
    @State private var searchText: String = ""

    // Load exercises from the CSV file
    private let exercises = loadExercisesFromCSV()
    
    private var equipmentOptions = ["All Equipment"] + ["Dumbbell", "Barbell", "Cable", "Machine", "Plate", "Bodyweight"].sorted(by: <)
    private var muscleGroupOptions = ["All Muscles"] + ["Chest", "Biceps", "Triceps", "Back", "Shoulders", "Quadriceps", "Calves", "Abdominals"].sorted(by: <)

    // Filtered exercises based on selected filters and search text
    var filteredExercises: [ExerciseData] {
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
            }
            .navigationTitle("List of Exercises")
        }
    }
}

// Struct for sample exercise data
struct ExerciseData: Identifiable {
    let id = UUID()
    let name: String
    let muscleGroup: String
    let equipment: String
}

#Preview {
    ListExercisesView2()
}
