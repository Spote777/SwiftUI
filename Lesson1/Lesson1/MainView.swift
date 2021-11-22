//
//  MainView.swift
//  Lesson1
//
//  Created by Павел Заруцков on 24.10.2021.
//

import SwiftUI

struct MainView: View {
    
    private let tabs = ["Друзья", "Фото", "Группы"]
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FriendsTable(viewModel: FriendViewModel(FriendAPI()))
                .navigationBarTitle(tabs[0], displayMode: .automatic)
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text(tabs[0])
                }
            
            PhotoTable(viewModel: PhotoViewModel(PhotoAPI()))
                .navigationBarTitle(tabs[1], displayMode: .automatic)
                .tabItem {
                    Image(systemName: "newspaper")
                    Text(tabs[1])
                }
                       
            GroupsTable(viewModel: GroupViewModel(GroupAPI()))
                .navigationBarTitle(tabs[2], displayMode: .automatic)
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text(tabs[2])
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
