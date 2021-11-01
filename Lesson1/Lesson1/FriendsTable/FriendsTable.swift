//
//  FriendsTable.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI

struct FriendsTable: View {
    
    private var friendsData: [FriendsModel] = [
        FriendsModel(name: "Иванов Иван", avatar: "3"),
        FriendsModel(name: "Павел Павлович", avatar: "1"),
        FriendsModel(name: "Иванов Иван", avatar: "2"),
        FriendsModel(name: "Павел Павлович", avatar: "3"),
        FriendsModel(name: "Иванов Иван", avatar: "1"),
        FriendsModel(name: "Александр Александрович", avatar: "2"),
        FriendsModel(name: "Иванов Иван", avatar: "3"),
        FriendsModel(name: "Александр Александрович", avatar: "1"),
        FriendsModel(name: "Иванов Иван", avatar: "2"),
    ]
    
    var body: some View {
        
        let friends = FriendsListWithSections(friendsData).friends
        
        List {
            ForEach(friends) { section in
                Section(header: Text(section.title)) {
                    ForEach(section.items) { friend in
                        NavigationLink(destination: FriendGallery(model: friend)) {
                            NamesPrototype(model: friend)
                        }
                    }
                }
            }
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsTable()
//            .previewDevice("iPhone 11")
//    }
//}
