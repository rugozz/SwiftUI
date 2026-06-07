//
//  InfoView.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct InfoView: View {
    let posts = samplePosts
    let titleOn: Bool // Свойство для управления заголовком
    
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
                //Индикатор состояния
                if !titleOn {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Title hidden")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    InfoView(titleOn: true)
}
#Preview("Without Title") {
    InfoView(titleOn: false)
}
