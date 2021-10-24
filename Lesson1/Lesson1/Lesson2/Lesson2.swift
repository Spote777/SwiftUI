//
//  Lesson2.swift
//  Lesson1
//
//  Created by Павел Заруцков on 24.10.2021.
//

import SwiftUI

struct Lesson2: View {
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Color.init(red: 1/255, green: 1/255, blue: 1/255, opacity: 0.7)
                    .edgesIgnoringSafeArea(.all)
            }
            ScrollView {
                VStack {
                    NamesPrototype (avatar: "1", name: "Иван Иванович")
                    NamesPrototype (avatar: "1", name: "Иван Иванович")
                    NamesPrototype (avatar: "1", name: "Иван Иванович")
                }
            }
        }
    }
}

struct Lesson2_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2()
    }
}


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


struct NamesPrototype: View {
    
    private var avatar: String
    private var name: String
    
    init(avatar: String, name: String) {
        self.avatar = avatar
        self.name = name
    }
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 10, content: {
            Image(avatar)
                .resizable()
                .frame(width: 60.0, height: 60.0)
                .modifier(CircleShadow(shadowColor:.black,shadowRadius: 1))
                .padding(.leading, 5.0)
            Text(name)
                .bold()
                .foregroundColor(.blue)
            
            Spacer()
        })
            .frame(maxHeight: 60.0,
                   alignment: .leading)
    }
}
