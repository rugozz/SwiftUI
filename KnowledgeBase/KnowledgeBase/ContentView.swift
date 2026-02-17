//
//  ContentView.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Первая вкладка - База знаний
            InfoView()
                .tabItem {
                    Label("Knowledge", systemImage: "book.fill")
                }
            
            // Вторая вкладка - Hello
            HellowView()
                .tabItem {
                    Label("Hellow", systemImage: "hand.wave.fill")
                }
            
            // Третья вкладка - Настройки
            SettingsView()
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
