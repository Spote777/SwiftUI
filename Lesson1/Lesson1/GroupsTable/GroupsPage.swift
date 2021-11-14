//
//  GroupsPage.swift
//  Lesson1
//
//  Created by Павел Заруцков on 14.11.2021.
//

import SwiftUI
import Kingfisher

struct GroupPageView: View {
    var group: GroupItem
    var body: some View {
        ScrollView {
            AvatarImage { KFImage(URL(string: group.imageURL)!) }
            Text(group.name).modifier(TitleText())
            Text("\(group.membersCount.formattedString) подписчиков.").modifier(SubTitleText())
            
            Divider().padding()
            
            Text(group.groupDescription ?? "Нет описания.").modifier(SubTitleText())
            
            Spacer()
        }.padding()
    }
}
