//
//  NamesPrototype.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI

struct NamesPrototype: View {
    
    private var avatar: String
    private var name: String
    
    init(model: SameDataSetProtocol) {
        avatar = model.avatar
        name = model.name
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
                .foregroundColor(.black)
            
            Spacer()
        })
            .frame(maxHeight: 60.0,
                   alignment: .leading)
    }
}
