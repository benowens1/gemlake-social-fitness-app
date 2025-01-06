//
//  ProfileView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 24/10/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            List {
                // User Stats Section
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading) {
                                Text("Chris Bumstead")
                                    .font(.headline)
                                Text("Classic Physique Mr. Olympia x5 🇨🇦")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        HStack(spacing: 20) {
                            VStack {
                                Text("137")
                                    .font(.headline)
                                Text("Workouts")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            VStack {
                                Text("723.4K")
                                    .font(.headline)
                                Text("Followers")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            VStack {
                                Text("32")
                                    .font(.headline)
                                Text("Following")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }

                // Workouts Section
                Section(header: Text("Workouts")) {
                    ForEach(0..<2) { index in
                        NavigationLink(destination: Text("Workout Detail View")) {
                            WorkoutSummaryView(workoutType: index == 0 ? "Weight Lifting" : "Cardio", date: "24/07/2024", isRecent: index == 0)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "calendar")
                        .font(.title2)
                }
            }
        }
    }
}

struct WorkoutSummaryView: View {
    let workoutType: String
    let date: String
    let isRecent: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: isRecent ? "figure.strengthtraining.traditional" : "figure.walk")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text("Chris Bumstead")
                        .font(.headline)
                    Text("\(workoutType) · \(date)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chart.bar.xaxis")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            HStack {
                VStack(alignment: .leading) {
                    Text("Time")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("1h 30m")
                        .font(.body)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Volume")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("6,558 kg")
                        .font(.body)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("PBs")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("3 🏆")
                        .font(.body)
                }
            }
            .padding(.top, 4)
        }
        .padding(.vertical, 4)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

#Preview {
    ProfileView()
}
