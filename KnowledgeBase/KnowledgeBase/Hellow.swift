//
//  Hellow.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct HellowView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Градиентный фон
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Анимированная иконка
                    Image(systemName: "hand.wave.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.blue)
                        .symbolEffect(.bounce, options: .repeating)
                    
                    // Текст Hello World
                    Text("Hello, World!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    // Подпись
                    Text("Welcome to your Knowledge Base App")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // Декоративная линия
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.blue.opacity(0.5))
                        .padding(.horizontal, 50)
                    
                    // Дополнительная информация
                    VStack(alignment: .leading, spacing: 15) {
                        InfoRowSmall(icon: "star.fill", text: "Explore knowledge base")
                        InfoRowSmall(icon: "gearshape.fill", text: "Customize settings")
                        InfoRowSmall(icon: "book.fill", text: "Learn something new")
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationTitle("Hello")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Вспомогательный компонент для отображения информации
struct InfoRowSmall: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30)
            Text(text)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    HellowView()
}
