//
//  PhotoTable.swift
//  Lesson1
//
//  Created by Павел Заруцков on 22.11.2021.
//

import SwiftUI
import Kingfisher

struct PhotoTable: View {
    @ObservedObject var viewModel: PhotoViewModel
    let columns = [
        //GridItem(.adaptive(minimum: 100, maximum: 250), spacing: 2),
        GridItem(.flexible(minimum: 50), spacing: 2),
        GridItem(.flexible(minimum: 50), spacing: 2),
        GridItem(.flexible(minimum: 50), spacing: 2),
    ]
    
    init(viewModel: PhotoViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {

        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(viewModel.photos) { photo in
                    GeometryReader { geometry in
                        NavigationLink(destination: PhotoRowView(photo: photo)) {
                            KFImage(URL(string: photo.photoAvailable!.url)!)
                                .resizable()
                                .scaledToFill()
                                .frame(height: geometry.size.width)
                        }
                    }
                    .clipped()
                    .aspectRatio(1, contentMode: .fit)
                }
            }
        }
        .onAppear { viewModel.fetch() }
    }
}
