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
    
    // Опции для Picker
    let fontSizeOptions = ["Small", "Medium", "Large"]
    let colorSchemeOptions = ["Light", "Dark", "System"]
    
    var body: some View {
        NavigationView {
            Form {
                // Секция профиля
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
                
                // Секция настроек отображения
                Section {
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
                    Text("Customize how the app looks")
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
        }
    }
}

#Preview {
    SettingsView()
}
