//
//  NewsModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import Foundation

final class NewsModel: SameDataSetProtocol, Identifiable {

    var id = UUID()
    
    var name:       String
    var avatar:     String
    var text:       String
    var likes:      Int
    var comments:   Int
    var repost:     Int
    var views:      Int
    
    internal init(name: String, avatar: String, text: String) {
        self.name = name
        self.avatar = avatar
        self.text = text
        
        self.likes = Int.random(in: 0...100)
        self.comments = Int.random(in: 0...100)
        self.repost = Int.random(in: 0...100)
        self.views = Int.random(in: 100...100)
    }
}
