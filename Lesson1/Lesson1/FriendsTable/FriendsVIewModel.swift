//
//  FriendsVIewModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 14.11.2021.
//

import SwiftUI

class FriendViewModel: ObservableObject {
    @Published var friends: [FriendItem] = []
    let api: FriendService
    
    init(_ api: FriendService) {
        self.api = api
    }
    
    public func fetch() {
        api.get { [weak self] friends in
            guard let self = self else { return }
            self.friends = friends!.response.items
        }
    }
}
