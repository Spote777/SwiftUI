//
//  ContentView.swift
//  Lesson1
//
//  Created by Павел Заруцков on 23.10.2021.
//

import SwiftUI
import Combine

struct ContentView: View {    
    
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                SignIn(isUserAuthorization: $shouldShowMainView)
                
                NavigationLink(destination: MainView(), isActive: $shouldShowMainView) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
