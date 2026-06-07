//
//  ContentView.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//


// ContentView.swift
import SwiftUI

struct ContentView: View {
    @AppStorage("navigationTitleEnabled") private var titleOn: Bool = true
    @State private var posts = samplePosts
    
    var body: some View {
        TabView {
            InfoView(posts: posts, titleOn: titleOn)
                .tabItem {
                    Label("Knowledge", systemImage: "book.fill")
                }
            
            QuizView { newPost in
                // Добавляем новый пост в базу знаний
                posts.append(newPost)
            }
            .tabItem {
                Label("Quiz", systemImage: "brain.head.profile")
            }
            
            SettingsView(titleOn: $titleOn)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
