//
//  PhotoRowView.swift
//  Lesson1
//
//  Created by Павел Заруцков on 22.11.2021.
//

import SwiftUI
import Kingfisher

struct PhotoRowView: View {
    var photo: PhotoItem
    
    var body: some View {
        VStack {
            KFImage(URL(string: photo.photoAvailable!.url)!)
                .resizable()
                .frame(width: photo.photoAvailable!.width / 2, height: photo.photoAvailable!.height / 2)
                .aspectRatio(1, contentMode: .fill)
            
            Spacer().frame(height: 50.0)
        }
    }
}
