//
//  InfoView.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct InfoView: View {
    let posts = samplePosts
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: InfoDetails(post: post)) {
                    InfoRow(post: post)
                }
            }
            .navigationTitle("Knowledge Base")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.plain)
        }
    }
}

#Preview {
    InfoView()
}
