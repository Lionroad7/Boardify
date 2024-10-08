//
//  File.swift
//  Boardify
//
//  Created by islombek on 07/10/24.
//

import SwiftUI

struct BoardifySignUpView: View {
    @State private var isKeyboardVisible = false
    @State private var isSignUpMode = true
    @State private var navigateToMainView = false // State to handle navigation
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    logoSection
                    if !isKeyboardVisible {
                        illustrationSection
                    }
                    existingAccountSection
                    inputFieldsSection
                    actionButton
                    Spacer()
                }
                .padding(.horizontal, 25)
                .edgesIgnoringSafeArea(.all)
                .animation(.easeInOut, value: isKeyboardVisible)
            }
            .onAppear {
                setupKeyboardObservers()
            }
            .onDisappear {
                removeKeyboardObservers()
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
    
    private var logoSection: some View {
        HStack {
            Spacer()
            Image("LogoIcon")
                .resizable()
                .frame(width: 40, height: 40)
            Text("BOARDIFY")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 154/255, green: 222/255, blue: 99/255))
            Spacer()
        }
        .padding(.top, 66)
    }
    
    private var illustrationSection: some View {
        HStack {
            Spacer()
            Image("Illustration")
                .resizable()
                .scaledToFit()
                .frame(height: 270)
                .padding(.top, 24)
            Spacer()
        }
    }
    
    private var existingAccountSection: some View {
        HStack {
            Spacer()
            Text(isSignUpMode ? "Already have an account?" : "Don’t you have an account?")
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Spacer()
            Button(action: {
                withAnimation {
                    isSignUpMode.toggle()
                }
            }) {
                Text(isSignUpMode ? "Sign in" : "Sign up")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .foregroundColor(Color(red: 154/255, green: 222/255, blue: 99/255))
            }
            Spacer()
        }
        .padding(.top, 20)
    }
    
    private var inputFieldsSection: some View {
        VStack(spacing: 10) {
            if isSignUpMode {
                CustomTextField(placeholder: "Enter your name")
                    .transition(.move(edge: .leading).combined(with: .opacity))
                    .foregroundColor(.black)
            }
            CustomTextField(placeholder: "Enter your email")
                .foregroundColor(.black)
            CustomTextField(placeholder: "Password", isSecure: true)
                .foregroundColor(.black)
        }
        .animation(.easeInOut, value: isSignUpMode)
    }
    
    private var actionButton: some View {
        NavigationLink(destination: MainTabView(), isActive: $navigateToMainView) {
            Button(action: {
                // Trigger navigation to MainTabView
                navigateToMainView = true
            }) {
                Text(isSignUpMode ? "Sign up" : "Sign in")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 154/255, green: 222/255, blue: 99/255))
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 159/255, green: 200/255, blue: 96/255), lineWidth: 4)
                    )
                    .cornerRadius(20)
            }
            .padding(.horizontal, 45)
            .padding(.top, 10)
            .animation(.easeInOut, value: isSignUpMode)
        }
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
            isKeyboardVisible = true
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            isKeyboardVisible = false
        }
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

struct CustomTextField: View {
    var placeholder: String
    var isSecure: Bool = false
    @State private var text: String = ""

    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .background(Color(red: 223/255, green: 245/255, blue: 213/255))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 192/255, green: 211/255, blue: 184/255), lineWidth: 2)
        )
        .foregroundColor(.gray)
    }
}



struct BoardifySignUpView_Previews: PreviewProvider {
    static var previews: some View {
        BoardifySignUpView()
    }
}
