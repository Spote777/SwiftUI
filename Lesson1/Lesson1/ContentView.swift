//
//  ContentView.swift
//  Lesson1
//
//  Created by Павел Заруцков on 23.10.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Color.orange
                Image("MainBackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("Weather App")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.top, 32)
                    }
                    VStack {
                        VStack {
                            Text("Login:")
                                .foregroundColor(.white)
                            TextField("Enter login", text: $login)
                                .frame(idealWidth: 350, maxWidth: 400, maxHeight: 44)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding()
                        
                        VStack {
                            Text("Password:")
                                .foregroundColor(.white)
                            SecureField("Enter password", text: $password)
                                .frame(idealWidth: 350, maxWidth: 400, maxHeight: 44)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding()
                    }
                    
                    Spacer(minLength: 100)
                    Button(action: { print("Hello") }) {
                        Text("Log in")
                            .font(.title2)
                    }
                    .frame(width: 250, height: 44, alignment: Alignment.center)
                    .accentColor(Color(.black))
                    .background(Color(UIColor.white.withAlphaComponent(0.6)))
                    .cornerRadius(10.0)
                    .disabled(login.isEmpty || password.isEmpty)
                    
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                }
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPod touch (7th generation)")
    }
}
