//
//  SampleData.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//


import Foundation

let samplePosts = [
    Post(
        title: "SwiftUI Basics",
        description: "SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before.",
        imageName: "swiftui-icon",
        quizQuestion: "What is SwiftUI?",
        quizAnswer: "A modern UI framework for Apple platforms"
    ),
    Post(
        title: "iOS Development",
        description: "iOS development involves creating applications for iPhone and iPad using Swift programming language and various frameworks.",
        imageName: "ios-icon",
        quizQuestion: "What language is primarily used for iOS development?",
        quizAnswer: "Swift"
    ),
    Post(
        title: "Xcode Tips",
        description: "Xcode is Apple's IDE for macOS. It contains a suite of software development tools for developing software for macOS, iOS, watchOS, and tvOS.",
        imageName: "xcode-icon",
        quizQuestion: "What is Xcode?",
        quizAnswer: "Apple's IDE for developing Apple platform apps"
    ),
    Post(
        title: "Swift Programming",
        description: "Swift is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS.",
        imageName: "swift-icon",
        quizQuestion: "Is Swift a compiled or interpreted language?",
        quizAnswer: "Compiled"
    ),
    Post(
        title: "Design Patterns",
        description: "Design patterns are reusable solutions to common problems in software design. They represent best practices used by experienced object-oriented software developers.",
        imageName: "design-patterns",
        quizQuestion: "What are design patterns?",
        quizAnswer: "Reusable solutions to common software design problems"
    )
]

// Для динамического добавления новых постов
var dynamicPosts: [Post] = []
