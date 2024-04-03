//
//  SplashScreenView.swift
//  TodoList
//
//  Created by Daniil Shutkin on 03.04.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        if isActive {
            ListView()
        } else {
            VStack {
                VStack {
                    Image("Octopus")
                        .resizable()
                        .scaledToFit()
                    Text("Todo list App")
                        .font(Font.custom("Baskerville-Bold", size: 28))
                        .padding(.bottom, 10)
                    Text("burningmannn.github.io")
                        .font(Font.custom("Menlo", size: 16))
                        .padding(.bottom, 20)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [secondaryAccentColor, .white, .accentColor]).opacity(0.6))
        }
    }
}

#Preview {
    SplashScreenView()
}
