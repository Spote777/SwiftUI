//
//  LikeButton.swift
//  Lesson1
//
//  Created by Павел Заруцков on 14.11.2021.
//

import SwiftUI

struct LikeButton : View {
    @State private var isLiked = false
    @State private var likesCount: Int = Int.random(in: 1...100)
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "heart.fill")
                    .opacity(isLiked ? 1 : 0)
                    .scaleEffect(isLiked ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 0.35))
                Image(systemName: "heart")
            }.foregroundColor(isLiked ? .red : .white)
            
            Text("\(likesCount)")
                .transition(.opacity.animation(.easeInOut(duration: 0.45)))
                .id(UUID())
        }
        .font(.system(size: 48))
        .onTapGesture {
            isLiked.toggle()
            likesCount += isLiked ? 1 : -1
        }
    }
}
