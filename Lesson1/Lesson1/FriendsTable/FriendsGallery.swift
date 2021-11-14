//
//  FriendsGallery.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI
import Kingfisher

struct FriendsGallery: View {
    var friend: FriendItem
    var body: some View {
        VStack {
            AvatarImage { KFImage(URL(string: friend.photo100!)!) }
            
            Text("\(friend.firstName) \(friend.lastName)")
                .modifier(TitleText())
            
            Spacer()
        }.padding()
    }
}

//struct FriendGallery: View {
//
//    private let name: String
//
//    init(model: FriendsModel) {
//        name = model.name
//    }
//
//    var body: some View {
//        VStack {
//            Text("Галлерея")
//            Text(name)
//        }
//    }
//}

