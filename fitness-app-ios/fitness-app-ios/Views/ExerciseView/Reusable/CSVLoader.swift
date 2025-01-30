//
//  CSVLoader.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 12/01/2025.
//

import Foundation

func loadExercisesFromCSV() -> [ExerciseDataModel] {
    guard let path = Bundle.main.path(forResource: "sample_exercises", ofType: "csv") else {
        print("CSV file not found.")
        return []
    }

    do {
        let data = try String(contentsOfFile: path, encoding: .utf8)
        let rows = data.split(separator: "\n").dropFirst() // Skip the header row
        return rows.map { row in
            let columns = row.split(separator: ",")
            return ExerciseDataModel(
                name: String(columns[0]),
                muscleGroup: String(columns[1]),
                equipment: String(columns[2])
            )
        }
    } catch {
        print("Error loading CSV file: \(error)")
        return []
    }
}
