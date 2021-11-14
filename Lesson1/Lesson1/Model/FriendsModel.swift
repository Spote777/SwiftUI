//
//  FriendsModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import Foundation

// MARK: - Friend
struct Friends: Codable {
    let response: FriendResponse
}

// MARK: - Response
struct FriendResponse: Codable {
    let count: Int
    let items: [FriendItem]
}

// MARK: - Item
struct FriendItem: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String?
    let online: Int?
    let sex: Int?
    let lastSeen: LastSeen?
    let trackCode: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case photo100 = "photo_100"
        case online, sex
        case lastSeen = "last_seen"
        case trackCode = "track_code"
    }
}

// MARK: - LastSeen
struct LastSeen: Codable {
    let platform: Int?
    let time: TimeInterval
}

//import SwiftUI
//
//final class FriendsModel: SameDataSetProtocol, Identifiable {
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
//
//
////  MARK:   - FriendsListWithSections
//
//struct ListWithSections: Identifiable {
//    let id: UUID
//
//    let title: String
//    let items: [FriendsModel]
//}
//
//final class FriendsListWithSections {
//    public var friends: [ListWithSections] = []
//
//    init(_ array: [FriendsModel]) {
//        let sortedArray = array.sorted(by: {$0.name < $1.name})
//
//        var items: [FriendsModel] = []
//        var title: Character? = sortedArray.first?.name.first
//
//        for data in sortedArray {
//            if (title == data.name.first) && (data.name.first != nil) {
//                items.append(data)
//            } else {
//                friends.append(ListWithSections(id: UUID(),
//                                                title: String(title ?? " "),
//                                                items: items))
//                title = data.name.first
//                items.removeAll()
//                items.append(data)
//            }
//        }
//
//        friends.append(ListWithSections(id: UUID(),
//                                        title: String(title ?? " "),
//                                        items: items))
//    }
//}
