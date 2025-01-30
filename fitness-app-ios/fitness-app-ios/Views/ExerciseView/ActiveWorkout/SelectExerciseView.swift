////
////  SelectExerciseView.swift
////  fitness-app-ios
////
////  Created by Ben Owens on 06/01/2025.
////
//
//import SwiftUI
//
//struct SelectExerciseView: View {
//    @Environment(\.dismiss) var dismiss
//    @Binding var selectedExercises: [ExerciseData]
//
//    // Load exercises from the CSV file
////    private let exercises = loadExercisesFromCSV()
//    
//    @State private var searchText: String = ""
//    @State private var selectedExerciseIDs: Set<UUID> = []
//
//    // Filtered exercises based on search text
//    var filteredExercises: [ExerciseDataModel] {
//        exercises.filter { exercise in
//            searchText.isEmpty || exercise.name.localizedCaseInsensitiveContains(searchText)
//        }
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
//                // Exercise List with multi-select functionality
//                List(filteredExercises) { exercise in
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(exercise.name)
//                                .font(.headline)
//                            Text(exercise.muscleGroup)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        Spacer()
//                        if selectedExerciseIDs.contains(exercise.id) {
//                            Image(systemName: "checkmark.circle.fill")
//                                .foregroundColor(.blue)
//                        } else {
//                            Image(systemName: "circle")
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    .contentShape(Rectangle())
//                    .onTapGesture {
//                        toggleSelection(for: exercise)
//                    }
//                }
//            }
//            .navigationTitle("Select Exercises")
//            .toolbar {
//                ToolbarItem(placement: .confirmationAction) {
//                    Button("Done") {
//                        // Add selected exercises to the active workout
//                        selectedExercises = exercises.filter { selectedExerciseIDs.contains($0.id) }
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
//    SelectExerciseView(selectedExercises: .constant([]))
//}
