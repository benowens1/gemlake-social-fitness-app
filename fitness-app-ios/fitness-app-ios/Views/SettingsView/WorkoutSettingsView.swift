//
//  WorkoutSettingsView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 07/01/2025.
//

import SwiftUI

struct WorkoutSettingsView: View {
    @Environment(\.dismiss) var dismiss

    // Settings State Variables
    @State private var timerSound: String = "Default"
    @State private var timerVolume: String = "High"
    @State private var defaultRestTimer: Bool = false
    @State private var keepAwakeDuringWorkout: Bool = false
    @State private var plateCalculatorEnabled: Bool = false
    @State private var rpeTrackingEnabled: Bool = false
    @State private var smartSupersetScrolling: Bool = false

    var body: some View {
        NavigationView {
            List {
                // Section 1: Timer Settings
                Section(header: Text("Timer Settings")) {
                    NavigationLink(destination: TimerSoundView(selectedSound: $timerSound)) {
                        HStack {
                            Text("Timer Sound")
                            Spacer()
                            Text(timerSound)
                                .foregroundColor(.gray)
                        }
                    }

                    NavigationLink(destination: TimerVolumeView(selectedVolume: $timerVolume)) {
                        HStack {
                            Text("Timer Volume")
                            Spacer()
                            Text(timerVolume)
                                .foregroundColor(.gray)
                        }
                    }

                    Toggle(isOn: $defaultRestTimer) {
                        Text("Default Rest Timer")
                    }
                }

                // Section 2: Workout Options
                Section(header: Text("Workout Options")) {
                    Toggle(isOn: $keepAwakeDuringWorkout) {
                        Text("Keep Awake During Workout")
                        Text("Enable this if you don't want your phone to sleep while you're in a workout.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Toggle(isOn: $plateCalculatorEnabled) {
                        Text("Plate Calculator")
                        Text("A plate calculator helps you determine the plates needed for barbell exercises.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Toggle(isOn: $rpeTrackingEnabled) {
                        Text("RPE Tracking")
                        Text("RPE (Rated Perceived Exertion) is a measure of intensity for each set.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Toggle(isOn: $smartSupersetScrolling) {
                        Text("Smart Superset Scrolling")
                        Text("Automatically scroll to the next exercise in the superset after completing a set.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Workout Settings")
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            })
        }
    }
}

// Timer Sound Selection View
struct TimerSoundView: View {
    @Binding var selectedSound: String
    let sounds = ["Default", "Beep", "Buzz", "Chime"]

    var body: some View {
        List {
            ForEach(sounds, id: \.self) { sound in
                HStack {
                    Text(sound)
                    Spacer()
                    if sound == selectedSound {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedSound = sound
                }
            }
        }
        .navigationTitle("Timer Sound")
    }
}

// Timer Volume Selection View
struct TimerVolumeView: View {
    @Binding var selectedVolume: String
    let volumes = ["Low", "Medium", "High"]

    var body: some View {
        List {
            ForEach(volumes, id: \.self) { volume in
                HStack {
                    Text(volume)
                    Spacer()
                    if volume == selectedVolume {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedVolume = volume
                }
            }
        }
        .navigationTitle("Timer Volume")
    }
}

#Preview {
    WorkoutSettingsView()
}
