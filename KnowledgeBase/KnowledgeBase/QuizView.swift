//
//  Hellow.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//

import SwiftUI

struct QuizView: View {
    // Состояния для викторины
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var showResult = false
    @State private var isAnswerCorrect = false
    @State private var score = 0
    @State private var answeredQuestions: Set<Int> = []
    @State private var showConfetti = false
    @State private var newPosts: [Post] = []
    
    // Замыкание для добавления нового поста в InfoView
    var onNewPostAdded: ((Post) -> Void)?
    
    // Фильтруем только посты с вопросами
    var quizPosts: [Post] {
        samplePosts.filter { !$0.quizQuestion.isEmpty }
    }
    
    var currentPost: Post {
        quizPosts[currentQuestionIndex]
    }
    
    var isQuestionAnswered: Bool {
        answeredQuestions.contains(currentQuestionIndex)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Градиентный фон
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.1), .purple.opacity(0.1)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 25) {
                        // Заголовок и прогресс
                        VStack(spacing: 15) {
                            HStack {
                                Text("Knowledge Quiz")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                // Счетчик очков
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text("\(score)")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(.ultraThinMaterial)
                                .cornerRadius(20)
                            }
                            
                            // Прогресс-бар
                            ProgressView(value: Double(currentQuestionIndex + 1), total: Double(quizPosts.count))
                                .tint(.blue)
                            Text("Question \(currentQuestionIndex + 1) of \(quizPosts.count)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal)
                        
                        if currentQuestionIndex < quizPosts.count {
                            // Карточка с вопросом
                            VStack(spacing: 20) {
                                // Изображение
                                currentPost.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                
                                // Вопрос
                                Text(currentPost.quizQuestion)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                // Поле для ответа
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Your Answer:")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                    
                                    TextField("Type your answer here...", text: $userAnswer)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .disabled(isQuestionAnswered)
                                }
                                .padding(.horizontal)
                                
                                // Кнопка проверки
                                if !isQuestionAnswered {
                                    Button(action: checkAnswer) {
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                            Text("Check Answer")
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    }
                                    .padding(.horizontal)
                                }
                                
                                // Результат
                                if showResult {
                                    VStack(spacing: 10) {
                                        HStack {
                                            Image(systemName: isAnswerCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                                .foregroundColor(isAnswerCorrect ? .green : .red)
                                            Text(isAnswerCorrect ? "Correct!" : "Wrong!")
                                                .font(.headline)
                                                .foregroundColor(isAnswerCorrect ? .green : .red)
                                        }
                                        
                                        if !isAnswerCorrect {
                                            Text("Correct answer: \(currentPost.quizAnswer)")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                        
                                        if isAnswerCorrect && !answeredQuestions.contains(currentQuestionIndex) {
                                            Button(action: addNewPostFromQuiz) {
                                                HStack {
                                                    Image(systemName: "plus.circle.fill")
                                                    Text("Add to Knowledge Base")
                                                }
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 10)
                                                .background(Color.green.opacity(0.2))
                                                .cornerRadius(10)
                                            }
                                            .padding(.top, 5)
                                        }
                                    }
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                }
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                        
                        // Навигационные кнопки
                        if currentQuestionIndex < quizPosts.count {
                            HStack(spacing: 20) {
                                if currentQuestionIndex > 0 {
                                    Button(action: previousQuestion) {
                                        HStack {
                                            Image(systemName: "chevron.left")
                                            Text("Previous")
                                        }
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                    }
                                }
                                
                                if currentQuestionIndex < quizPosts.count - 1 {
                                    Button(action: nextQuestion) {
                                        HStack {
                                            Text("Next")
                                            Image(systemName: "chevron.right")
                                        }
                                        .padding()
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(10)
                                    }
                                    .disabled(!isQuestionAnswered)
                                } else if isQuestionAnswered {
                                    Button(action: resetQuiz) {
                                        HStack {
                                            Image(systemName: "arrow.clockwise")
                                            Text("Restart Quiz")
                                        }
                                        .padding()
                                        .background(Color.purple.opacity(0.2))
                                        .cornerRadius(10)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Список добавленных постов
                        if !newPosts.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("New Knowledge Added:")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ForEach(newPosts) { post in
                                    HStack {
                                        post.image
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(8)
                                        
                                        VStack(alignment: .leading) {
                                            Text(post.title)
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                            Text(post.description)
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                                .lineLimit(1)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                }
                            }
                            .padding(.vertical)
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                
                // Confetti эффект
                if showConfetti {
                    ConfettiView()
                        .allowsHitTesting(false)
                }
            }
            .navigationTitle("Quiz")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Functions
    
    private func checkAnswer() {
        let isCorrect = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
            .localizedCaseInsensitiveCompare(currentPost.quizAnswer) == .orderedSame
        
        isAnswerCorrect = isCorrect
        showResult = true
        
        if isCorrect && !answeredQuestions.contains(currentQuestionIndex) {
            score += 10
            answeredQuestions.insert(currentQuestionIndex)
            showConfettiEffect()
        }
    }
    
    private func addNewPostFromQuiz() {
        let newPost = Post(
            title: "Quiz: \(currentPost.title)",
            description: "Successfully learned about \(currentPost.title). Answer: \(currentPost.quizAnswer)",
            imageName: currentPost.imageName,
            quizQuestion: "",
            quizAnswer: ""
        )
        
        newPosts.append(newPost)
        onNewPostAdded?(newPost)
        
        // Анимация добавления
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    private func nextQuestion() {
        withAnimation {
            currentQuestionIndex += 1
            resetCurrentQuestionState()
        }
    }
    
    private func previousQuestion() {
        withAnimation {
            currentQuestionIndex -= 1
            resetCurrentQuestionState()
        }
    }
    
    private func resetCurrentQuestionState() {
        userAnswer = ""
        showResult = false
        isAnswerCorrect = false
    }
    
    private func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
        answeredQuestions.removeAll()
        resetCurrentQuestionState()
    }
    
    private func showConfettiEffect() {
        showConfetti = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showConfetti = false
        }
    }
}

// MARK: - Confetti View (UIKit интеграция)
struct ConfettiView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        // Создаем конфетти частицы
        let colors: [UIColor] = [.red, .blue, .green, .yellow, .purple, .orange]
        
        for _ in 0..<50 {
            let confetti = UIView()
            confetti.backgroundColor = colors.randomElement()
            confetti.frame = CGRect(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                                   y: -20,
                                   width: CGFloat.random(in: 5...10),
                                   height: CGFloat.random(in: 5...10))
            confetti.layer.cornerRadius = CGFloat.random(in: 0...5)
            view.addSubview(confetti)
            
            // Анимация падения
            UIView.animate(withDuration: Double.random(in: 1...3),
                          delay: 0,
                          options: .curveEaseIn) {
                confetti.frame.origin.y = UIScreen.main.bounds.height
                confetti.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360))
            } completion: { _ in
                confetti.removeFromSuperview()
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    QuizView()
}
