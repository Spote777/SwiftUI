//
//  GroupModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import Foundation

// MARK: - Main
struct Groups: Codable {
    let response: GroupResponse
}

// MARK: - Response
struct GroupResponse: Codable {
    let count: Int
    let items: [GroupItem]
}

// MARK: - Item
class GroupItem: Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var groupDescription: String?
    var imageURL: String = ""
    var membersCount: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, name
        case groupDescription = "description"
        case imageURL = "photo_100"
        case membersCount = "members_count"
    }
}


//import Foundation
//
//final class GroupModel: SameDataSetProtocol, Identifiable {
//
//    var id = UUID()
//
//    var name:   String
//    var avatar: String
//
//    internal init(name: String, avatar: String) {
//        self.name = name
//        self.avatar = avatar
//    }
//}
