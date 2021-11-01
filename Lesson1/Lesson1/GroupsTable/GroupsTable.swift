//
//  GroupsTable.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI

struct GroupsTable: View {
    
    private var groups: [GroupModel] = [
        GroupModel(name: "GeekBrains: iOS - разработка", avatar: ""),
        GroupModel(name: "Музыка", avatar: ""),
        GroupModel(name: "Бавария", avatar: ""),
        GroupModel(name: "Итальянский язык", avatar: ""),
        GroupModel(name: "Строим дом", avatar: "")
    ]
    
    
    var body: some View {
        List(groups) { group in
            NamesPrototype(model: group)
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsTable()
//    }
//}
