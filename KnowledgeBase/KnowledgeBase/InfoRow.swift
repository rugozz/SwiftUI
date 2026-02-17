//
//  InfoRow.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct InfoRow: View {
    let post: Post
    
    var body: some View {
        HStack {
            
            post.image
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                )
                .shadow(radius: 2)
            VStack(alignment: .leading, spacing: 4) {
                Text(post.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(post.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    InfoRow(post: samplePosts[0])
        .padding()
}
