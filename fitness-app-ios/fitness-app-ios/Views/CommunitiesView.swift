//
//  CommunityView.swift
//  fitness-app-ios
//
//  Created by Ben Owens on 24/10/2024.
//

import SwiftUI

struct CommunitiesView: View {
    var body: some View {
        NavigationView {
            List {
                // New Community Button
                Section {
                    Button(action: {
                        // Placeholder action for creating a new community
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                            Text("New community")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 8)
                    }
                }

                // Community List Section
                Section(header: Text("Communities")) {
                    ForEach(0..<3) { index in
                        NavigationLink(destination: Text("Community Detail View")) {
                            HStack {
                                Image(systemName: "person.3.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("Community \(index + 1)")
                                        .font(.headline)
                                    Text("Last post summary")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                                Spacer()
                                VStack {
                                    Text("2h ago")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.green) // Indicator for new messages
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }

                // Chats Section
                Section(header: Text("Chats")) {
                    ForEach(0..<5) { index in
                        NavigationLink(destination: Text("Chat View")) {
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("User \(index + 1)")
                                        .font(.headline)
                                    Text("Last message preview")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                                Spacer()
                                VStack {
                                    Text("1h ago")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.green) // Indicator for unread messages
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Communities")
        }
    }
}

struct CommunitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CommunitiesView()
    }
}

#Preview {
    CommunitiesView()
}
