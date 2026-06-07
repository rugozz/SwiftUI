//
//  Post.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//


import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    
    // Новые поля для викторины
    let quizQuestion: String
    let quizAnswer: String
    
    var image: Image {
        Image(imageName)
    }
    
    // Инициализатор для существующих постов (без викторины)
    init(title: String, description: String, imageName: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.quizQuestion = ""
        self.quizAnswer = ""
    }
    
    // Инициализатор для новых постов из викторины
    init(title: String, description: String, imageName: String, quizQuestion: String, quizAnswer: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.quizQuestion = quizQuestion
        self.quizAnswer = quizAnswer
    }
}
