//
//  ViewModifier.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                            .fill(Color.white)
                            .shadow(color: shadowColor, radius: shadowRadius))
            .clipped()
    }
}
