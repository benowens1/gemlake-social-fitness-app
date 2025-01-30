////
////  SelectExerciseView2.swift
////  fitness-app-ios
////
////  Created by Ben Owens on 07/01/2025.
////
//
//import SwiftUI
//
//struct SelectExerciseView2: View {
//    @Environment(\.dismiss) var dismiss
//    @Binding var selectedExercises: [ExerciseData]
//
//    // Load exercises from the CSV file
//    private let exercises = loadExercisesFromCSV()
//    
//    @State private var searchText: String = ""
//    @State private var selectedEquipment: String = "All Equipment"
//    @State private var selectedMuscleGroup: String = "All Muscles"
//    
//    // Keep track of selected exercise IDs
//    @State private var selectedExerciseIDs: Set<UUID>
//
//    // Filter options
//    private var equipmentOptions = ["All Equipment"] + ["Dumbbell", "Barbell", "Cable", "Machine", "Plate", "Bodyweight"].sorted(by: <)
//    private var muscleGroupOptions = ["All Muscles"] + ["Chest", "Biceps", "Triceps", "Back", "Shoulders", "Quadriceps", "Calves", "Abdominals"].sorted(by: <)
//
//    // Filtered exercises based on search text and selected filters
//    var filteredExercises: [ExerciseData] {
//        exercises.filter { exercise in
//            (selectedEquipment == "All Equipment" || exercise.equipment == selectedEquipment) &&
//            (selectedMuscleGroup == "All Muscles" || exercise.muscleGroup == selectedMuscleGroup) &&
//            (searchText.isEmpty || exercise.name.localizedCaseInsensitiveContains(searchText))
//        }
//    }
//
//    init(selectedExercises: Binding<[ExerciseData]>) {
//        self._selectedExercises = selectedExercises
//        self._selectedExerciseIDs = State(initialValue: Set(selectedExercises.wrappedValue.map { $0.id }))
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Search Bar
//                TextField("Search exercises...", text: $searchText)
//                    .padding(10)
//                    .background(Color(.systemGray6))
//                    .cornerRadius(8)
//                    .padding(.horizontal)
//
//                // Filter Section
//                HStack {
//                    Picker("Equipment", selection: $selectedEquipment) {
//                        ForEach(equipmentOptions, id: \.self) { equipment in
//                            Text(equipment).tag(equipment)
//                        }
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                    .padding(.horizontal)
//                    
//                    Picker("Muscle Group", selection: $selectedMuscleGroup) {
//                        ForEach(muscleGroupOptions, id: \.self) { group in
//                            Text(group).tag(group)
//                        }
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                    .padding(.horizontal)
//                }
//
//                // Exercise List with multi-select functionality
//                if filteredExercises.isEmpty {
//                    Text("No exercises found.")
//                        .foregroundColor(.gray)
//                        .padding()
//                } else {
//                    List(filteredExercises) { exercise in
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(exercise.name)
//                                    .font(.headline)
//                                Text(exercise.muscleGroup)
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                            Spacer()
//                            if selectedExerciseIDs.contains(exercise.id) {
//                                Image(systemName: "checkmark.circle.fill")
//                                    .foregroundColor(.blue)
//                            } else {
//                                Image(systemName: "circle")
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                        .contentShape(Rectangle()) // Make the entire row tappable
//                        .onTapGesture {
//                            toggleSelection(for: exercise)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Select Exercises")
//            .toolbar {
//                ToolbarItem(placement: .confirmationAction) {
//                    Button("Done") {
//                        // Pass the selected exercises back to ActiveWorkoutView
//                        selectedExercises = exercises.filter { selectedExerciseIDs.contains($0.id) }
//                        
//                        dismiss()
//                    }
//                }
//                ToolbarItem(placement: .cancellationAction) {
//                    Button("Cancel") {
//                        dismiss()
//                    }
//                }
//            }
//        }
//    }
//
//    // Function to toggle exercise selection
//    private func toggleSelection(for exercise: ExerciseData) {
//        if selectedExerciseIDs.contains(exercise.id) {
//            selectedExerciseIDs.remove(exercise.id)
//        } else {
//            selectedExerciseIDs.insert(exercise.id)
//        }
//    }
//}
//
//#Preview {
//    SelectExerciseView2(selectedExercises: .constant([]))
//}
