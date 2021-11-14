//
//  FriendsRowView.swift
//  Lesson1
//
//  Created by Павел Заруцков on 14.11.2021.
//

import SwiftUI
import Kingfisher

struct FriendRowView: View {
    var friend: FriendItem
    
    var body: some View {
        HStack {
            AvatarImage {
                KFImage(URL(string: friend.photo100!)!)
            }
            
            VStack(alignment: .leading) {
                Text("\(friend.firstName) \(friend.lastName)")
                    .lineLimit(1)
                    .modifier(TitleText())
                
                if friend.online == 1 {
                    Text("Сейчас онлайн.")
                        .modifier(OnlineText())
                } else {
                    Text("\(friend.sex == 1 ? "Была" : "Был") \(friend.lastSeen?.time.getRelativeDateStringFromUTC().lowercased() ?? "").")
                        .modifier(OfflineText())
                }
                
            }.padding(.leading, 10)
        }.padding(.top, 20).padding(.bottom, 20)
    }
}
