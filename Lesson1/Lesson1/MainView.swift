//
//  MainView.swift
//  Lesson1
//
//  Created by Павел Заруцков on 24.10.2021.
//

import SwiftUI

struct MainView: View {
    
    private let tabs = ["Друзья", "Группы", "Новости"]
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FriendsTable()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text(tabs[0])
                }
                .tag(0)
            
            GroupsTable()
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text(tabs[1])
                }
                .tag(1)

            
            NewsTable()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text(tabs[2])
                }
                .tag(2)
        }
        .navigationBarTitle(tabs[selectedTab], displayMode: .inline)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
