//
//  NewsPrototype.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI

struct NewsPrototype: View {
    
    private let model: NewsModel

    init(model: NewsModel) {
        self.model = model
    }
    
    var body: some View {
        
        VStack(alignment: HorizontalAlignment.center, spacing: 10.0) {
            NamesPrototype(model: model)
            
            Text(model.text)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.leading, 5.0)
            
            SocialActivityPanel(likes: model.likes,
                                comments: model.comments,
                                reposts: model.repost,
                                views: model.views)
                .padding(.bottom, 5.0)
        }
    }
}

