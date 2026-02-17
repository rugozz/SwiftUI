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
    
    var image: Image {
        Image(imageName)
    }
    
}
