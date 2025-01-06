//
//  FeedView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 02/01/2025.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Header for the current day
                Text(Date.now, style: .date) // Displays today's date
                    .font(.title)
                    .bold()
                    .padding(.vertical, 10)
                
                Divider() // Separates header from the feed content
                
                // Placeholder for feed content
                ScrollView {
                    VStack(spacing: 15) {
                        // Example workout posts
                        ForEach(0..<5) { index in
                            WorkoutPostView(username: "User \(index + 1)", workoutTitle: "Workout \(index + 1)", time: "\(index + 1)h ago")
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Reusable workout post view
struct WorkoutPostView: View {
    let username: String
    let workoutTitle: String
    let time: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(username)
                    .font(.headline)
                Spacer()
                Text(time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Text(workoutTitle)
                .font(.body)
                .foregroundColor(.primary)
            
            Divider() // Adds a line between posts
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    FeedView()
}
