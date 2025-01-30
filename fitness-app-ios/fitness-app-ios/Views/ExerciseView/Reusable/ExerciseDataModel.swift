//
//  ExerciseDataModel.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 12/01/2025.
//

import Foundation

struct ExerciseDataModel: Identifiable, Equatable {
    let id: UUID
    let name: String
    let muscleGroup: String
    let equipment: String

    init(id: UUID = UUID(), name: String, muscleGroup: String, equipment: String) {
        self.id = id
        self.name = name
        self.muscleGroup = muscleGroup
        self.equipment = equipment
    }
}
