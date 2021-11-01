//
//  FriendsGallery.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI

struct FriendGallery: View {
    
    private let name: String
    
    init(model: FriendsModel) {
        name = model.name
    }
    
    var body: some View {
        VStack {
            Text("Галлерея")
            Text(name)
        }
    }
}

