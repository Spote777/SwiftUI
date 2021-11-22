//
//  PhotoModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 22.11.2021.
//

import SwiftUI

struct Photos: Codable {
    let response: PhotoResponse
}

struct PhotoResponse: Codable {
    let count: Int
    let items: [PhotoItem]?
}

struct PhotoItem: Codable, Identifiable {
    let albumID, date, id, ownerID: Int?
    let hasTags: Bool?
    let sizes: [Size]?
    let text: String?
    let lat, long: Double?
    let postID: Int?
    
    var photoAvailable: Size? {
        
        guard let sizes = self.sizes else { return nil }
        if let photo = sizes.first(where: {$0.type == "x"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "z"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "y"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "m"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "s"}) { return photo }
        
        return sizes.first
    }

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case sizes, text, lat, long
        case postID = "post_id"
    }
}


// MARK: - Size

struct Size: Codable {
    let width: CGFloat
    let height: CGFloat
    let url: String
    let type: String
}
