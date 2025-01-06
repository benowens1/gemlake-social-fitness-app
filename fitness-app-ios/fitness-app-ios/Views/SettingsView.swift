//
//  SettingsView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 24/10/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                // Profile Section
                Section {
                    HStack {
                        Image(systemName: "person") // Placeholder for actual image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("Ben Owens")
                                .font(.headline)
                            Text("450 Activities")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "qrcode")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 8)
                }

                // Account section
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Account")) {
                        SettingsRow(icon: "lock", title: "Account")
                    }
                    NavigationLink(destination: Text("Notifications")) {
                        SettingsRow(icon: "bell", title: "Notifications")
                    }
                    NavigationLink(destination: Text("Premium Membership")) {
                        SettingsRow(icon: "crown", title: "Premium Membership")
                    }
                    NavigationLink(destination: Text("Privacy")) {
                        SettingsRow(icon: "key", title: "Privacy")
                    }
                }

                // Preferences section
                Section(header: Text("Preferences")) {
                    NavigationLink(destination: Text("Privacy")) {
                        SettingsRow(icon: "lock", title: "Privacy")
                    }
                    NavigationLink(destination: Text("Measurements")) {
                        SettingsRow(icon: "ruler", title: "Measurements")
                    }
                    NavigationLink(destination: Text("Weight Tracker")) {
                        SettingsRow(icon: "platter.top.applewatch.case", title: "Weight Tracker")
                    }
                    NavigationLink(destination: Text("Apple Health")) {
                        SettingsRow(icon: "heart", title: "Apple Health")
                    }
                    NavigationLink(destination: Text("Language")) {
                        SettingsRow(icon: "flag", title: "Language")
                    }
                    NavigationLink(destination: Text("Import & Export Data")) {
                        SettingsRow(icon: "link", title: "Import & Export Data")
                    }
                }
                
                // Help section
                Section(header: Text("Help & Guides")) {
                    NavigationLink(destination: Text("Getting Started Guide")) {
                        SettingsRow(icon: "info.circle", title: "Getting Started Guide")
                    }
                    NavigationLink(destination: Text("Routine Guide")) {
                        SettingsRow(icon: "list.bullet.clipboard", title: "Routine Guide")
                    }
                    NavigationLink(destination: Text("Frequently Asked Questions")) {
                        SettingsRow(icon: "questionmark.circle", title: "Frequently Asked Questions")
                    }
                    NavigationLink(destination: Text("Feature Request")) {
                        SettingsRow(icon: "lightbulb.max", title: "Feature Request")
                    }
                    NavigationLink(destination: Text("Review on the App Store")) {
                        SettingsRow(icon: "star", title: "Review on the App Store")
                    }
                }
            }
            .navigationTitle("Settings")
            .listStyle(GroupedListStyle())
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.body) // Adjust the size to match the style you want
                .foregroundColor(.primary)
            Text(title)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SettingsView()
}
