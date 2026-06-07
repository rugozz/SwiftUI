//
//  InfoView.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct InfoView: View {
    let posts: [Post]
    let titleOn: Bool
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: InfoDetails(post: post)) {
                    InfoRow(post: post)
                }
            }
            .navigationTitle(titleOn ? "Knowledge Base" : "")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if !titleOn {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Title hidden")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .overlay {
                if posts.isEmpty {
                    ContentUnavailableView(
                        "No Knowledge Yet",
                        systemImage: "book.closed",
                        description: Text("Complete quizzes to add knowledge!")
                    )
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    InfoView(posts: samplePosts, titleOn: true)
}
