//
//  SingIn.swift
//  Lesson1
//
//  Created by Павел Заруцков on 01.11.2021.
//

import SwiftUI
import Combine

struct SignIn: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    @State private var isWrongPasswordMpdalShown = false

    @Binding var isUserAuthorization: Bool
    
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
                Color.init(red: 0.07, green: 0.20, blue: 0.27, opacity: 1)
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("VKontakte")
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
                    Button(action: {
                        let result = verifyLoginData()
                        isWrongPasswordMpdalShown = !result
                        isUserAuthorization = result
                        
                    }) {
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
            }.alert(isPresented: $isWrongPasswordMpdalShown, content: { Alert(title: Text("Error"), message: Text("Incorrent Login/Password was entered"))
            })
        }.ignoresSafeArea()
    }
    
    private func verifyLoginData() -> Bool {
        return (login == "1" && password == "1")
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

