//
//  ContentView.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//


import SwiftUI

struct ContentView: View {
    // @AppStorage сохраняет значение в UserDefaults
    // Ключ "navigationTitleEnabled" используется для сохранения/загрузки
    // Значение по умолчанию: true
    @AppStorage("navigationTitleEnabled") private var titleOn: Bool = true
    
    var body: some View {
        TabView {
            // Первая вкладка - База знаний
            InfoView(titleOn: titleOn)
                .tabItem {
                    Label("Knowledge", systemImage: "book.fill")
                }
            
            // Вторая вкладка - Hello
            HellowView()
                .tabItem {
                    Label("Hello", systemImage: "hand.wave.fill")
                }
            
            // Третья вкладка - Настройки
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
