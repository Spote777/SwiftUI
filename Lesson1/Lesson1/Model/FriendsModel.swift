//
//  FriendsModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI

final class FriendsModel: SameDataSetProtocol, Identifiable {
    
    var id = UUID()
    
    var name:   String
    var avatar: String
    
    internal init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}


//  MARK:   - FriendsListWithSections

struct ListWithSections: Identifiable {
    let id: UUID
    
    let title: String
    let items: [FriendsModel]  
}

final class FriendsListWithSections {
    public var friends: [ListWithSections] = []
    
    init(_ array: [FriendsModel]) {
        let sortedArray = array.sorted(by: {$0.name < $1.name})
        
        var items: [FriendsModel] = []
        var title: Character? = sortedArray.first?.name.first
        
        for data in sortedArray {
            if (title == data.name.first) && (data.name.first != nil) {
                items.append(data)
            } else {
                friends.append(ListWithSections(id: UUID(),
                                                title: String(title ?? " "),
                                                items: items))
                title = data.name.first
                items.removeAll()
                items.append(data)
            }
        }
        
        friends.append(ListWithSections(id: UUID(),
                                        title: String(title ?? " "),
                                        items: items))
    }
}
