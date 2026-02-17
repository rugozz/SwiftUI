//
//  InfoDetails.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct InfoDetails: View {
    let post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                post.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(post.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(post.description)
                        .font(.body)
                        .lineSpacing(8)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Details")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "number.circle.fill")
                            .foregroundColor(.blue)
                        Text("ID: \(post.id)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "tag.fill")
                            .foregroundColor(.green)
                        Text("Category: Knowledge Base")
                            .font(.subheadline)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(post.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    InfoDetails(post: samplePosts[0])
}
