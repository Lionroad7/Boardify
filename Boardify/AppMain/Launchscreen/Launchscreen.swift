//
//  Launchscreen.swift
//  Boardify
//
//  Created by islombek on 07/10/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive: Bool = false
    @State private var scaleEffect: CGFloat = 5
    @State private var opacity: Double = 1
    @State private var transition: Bool = false
    @State private var offset: CGFloat = 0

    var body: some View {
        if isActive {
            BoardifySignUpView()
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color(red: 154/255, green: 222/255, blue: 99/255)]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                HStack {
                    Image("LogoIcon")
                        .resizable()
                        .frame(width: 55, height: 55)
                    Text("BOARDIFY")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 154/255, green: 222/255, blue: 99/255))
                }
                .offset(y: offset)
             //   .scaleEffect(scaleEffect)
                .opacity(opacity)
                .animation(.easeInOut(duration: 1.5).repeatCount(1))
                .onAppear {
            
                    withAnimation(.linear(duration: 1.2)) {
                        self.scaleEffect = 9.0
                        self.opacity = 1.0
                        self.offset = -UIScreen.main.bounds.height / 2 + 80
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            self.transition = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeIn(duration: 0.5)) {
                                self.isActive = true
                            }
                        }
                    }
                }
                
                // Sunshine Effect
                RadialGradient(
                    gradient: Gradient(colors: [Color.clear, ]),
                    center: .center,
                    startRadius: 0,
                    endRadius: 300
                )
                .blendMode(.overlay)
                .opacity(0.3)
                .scaleEffect(1.5)
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true))
            }
            .opacity(transition ? 5 : 1) 
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
