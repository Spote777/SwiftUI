//
//  GroupModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import Foundation

final class GroupModel: SameDataSetProtocol, Identifiable {
    
    var id = UUID()
    
    var name:   String
    var avatar: String
    
    internal init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
