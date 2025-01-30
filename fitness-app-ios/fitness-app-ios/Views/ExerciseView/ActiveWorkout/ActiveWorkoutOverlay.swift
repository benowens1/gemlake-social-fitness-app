//
//  ActiveWorkoutOverlay.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 06/01/2025.
//

import SwiftUI

struct ActiveWorkoutOverlay: View {
    @Binding var isWorkoutActive: Bool
    @State private var showActiveWorkoutView = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Active Workout")
                    .font(.headline)
                Text("Tap to expand")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {
                withAnimation {
                    isWorkoutActive = false // End the workout
                }
            }) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
                    .padding(.trailing)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground).opacity(0.95))
        .cornerRadius(12)
        .shadow(radius: 5)
        .onTapGesture {
            // Expand to full-screen workout tracker
            withAnimation {
                showActiveWorkoutView = true
            }
        }
        .sheet(isPresented: $showActiveWorkoutView) {
            ActiveWorkoutView4() // Full-screen workout tracker
        }
    }
}

#Preview {
    ActiveWorkoutOverlay(isWorkoutActive: .constant(true))
}
