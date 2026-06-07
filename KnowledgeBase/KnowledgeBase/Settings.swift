//
//  Settings.swift
//  KnowledgeBase
//
//  Created by Лисин Никита on 17.02.2026.
//




import SwiftUI

struct SettingsView: View {
    // Состояния для элементов управления
    @State private var isNotificationsEnabled = true
    @State private var selectedFontSize = 1
    @State private var brightnessLevel = 0.7
    @State private var username = "User"
    @State private var selectedColorScheme = 0
    
    // Binding переменная для связи с ContentView
    @Binding var titleOn: Bool
    
    // Переменная окружения для отслеживания цветовой схемы
    @Environment(\.colorScheme) var colorScheme
    
    // Опции для Picker
    let fontSizeOptions = ["Small", "Medium", "Large"]
    let colorSchemeOptions = ["Light", "Dark", "System"]
    
    // Вычисляемое свойство для текста цветовой схемы
    var colorSchemeText: String {
        colorScheme == .light ? "☀️ Light Theme enabled" : "🌙 Dark Theme enabled"
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Секция с информацией о цветовой схеме
                Section {
                    HStack {
                        Image(systemName: colorScheme == .light ? "sun.max.fill" : "moon.fill")
                            .foregroundColor(colorScheme == .light ? .orange : .purple)
                            .font(.title2)
                        
                        Text(colorSchemeText)
                            .font(.body)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Circle()
                            .fill(colorScheme == .light ? Color.orange : Color.purple)
                            .frame(width: 8, height: 8)
                            .opacity(0.7)
                    }
                    .padding(.vertical, 4)
                } header: {
                    Text("Current Theme")
                } footer: {
                    Text("Theme changes automatically based on system settings")
                }
                
                // Секция настроек отображения
                Section {
                    // Переключатель для управления заголовком InfoView
                    Toggle(isOn: $titleOn) {
                        Label {
                            Text("Show Navigation Title")
                                .font(.body)
                        } icon: {
                            Image(systemName: "textformat.header")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    // Условный текст, отображаемый при включенном переключателе
                    if titleOn {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.caption)
                            Text("Navigation title enabled")
                                .font(.caption)
                                .foregroundColor(.green)
                            Spacer()
                        }
                        .padding(.top, 4)
                        .transition(.opacity.combined(with: .slide))
                    }
                    
                    Divider()
                        .padding(.vertical, 8)
                    
                    Picker("Font Size", selection: $selectedFontSize) {
                        ForEach(0..<fontSizeOptions.count, id: \.self) { index in
                            Text(fontSizeOptions[index])
                        }
                    }
                    
                    Picker("Color Scheme", selection: $selectedColorScheme) {
                        ForEach(0..<colorSchemeOptions.count, id: \.self) { index in
                            Text(colorSchemeOptions[index])
                        }
                    }
                    
                    HStack {
                        Text("Brightness")
                        Slider(value: $brightnessLevel, in: 0...1)
                        Image(systemName: brightnessLevel > 0.7 ? "sun.max.fill" : "sun.min")
                            .foregroundColor(.yellow)
                    }
                } header: {
                    Text("Display Settings")
                } footer: {
                    Text("Customize how the app looks. Navigation title setting is saved automatically.")
                }
                
                // Секция профиля (остальная часть без изменений)
                Section {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading) {
                            Text(username)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Member since 2024")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 8)
                    }
                    .padding(.vertical, 8)
                } header: {
                    Text("Profile")
                } footer: {
                    Text("Your personal information")
                }
                
                // Секция уведомлений
                Section {
                    Toggle(isOn: $isNotificationsEnabled) {
                        Label {
                            Text("Push Notifications")
                        } icon: {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.red)
                        }
                    }
                    
                    if isNotificationsEnabled {
                        HStack {
                            Text("Notification sound")
                            Spacer()
                            Text("Default")
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                } header: {
                    Text("Notifications")
                } footer: {
                    Text(isNotificationsEnabled ? "Notifications are enabled" : "Turn on notifications to stay updated")
                }
                
                // Секция информации
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Build")
                        Spacer()
                        Text("2024.1")
                            .foregroundColor(.secondary)
                    }
                    
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        HStack {
                            Text("Privacy Policy")
                            Spacer()
                            Image(systemName: "link")
                                .font(.caption)
                        }
                    }
                    .foregroundColor(.blue)
                    
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        HStack {
                            Text("Terms of Service")
                            Spacer()
                            Image(systemName: "link")
                                .font(.caption)
                        }
                    }
                    .foregroundColor(.blue)
                } header: {
                    Text("About")
                }
                
                // Секция с дополнительными опциями
                Section {
                    Button(action: {
                        // Действие для сброса настроек
                    }) {
                        HStack {
                            Spacer()
                            Text("Reset All Settings")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .animation(.easeInOut, value: titleOn)
        }
    }
}

#Preview {
    SettingsView(titleOn: .constant(true))
}
