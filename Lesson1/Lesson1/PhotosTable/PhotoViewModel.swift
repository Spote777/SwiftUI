//
//  PhotoViewModel.swift
//  Lesson1
//
//  Created by Павел Заруцков on 22.11.2021.
//

import SwiftUI

class PhotoViewModel: ObservableObject {
    @Published var photos: [PhotoItem] = []
    let api: PhotoService
    
    init(_ api: PhotoService) {
        self.api = api
    }
    
    public func fetch() {
        api.get { [weak self] photo in
            guard let self = self else { return }
            self.photos = photo!.response.items!
        }
    }
}
