//
//  VectorView.swift
//  SomethingWentWrongAnimation
//
//  Created by Abdul Karim Khan on 20/12/2023.
//

import SwiftUI

struct VectorView: View {
    
    @State var shake = false
    @State var makeActive = false
    @State var animateWhiteCircle = false

    var body: some View {
        ZStack {
            Circle()
                .fill(.gray.opacity(0.2))
            Circle()
                .fill(.white.opacity(0.5))
                .scaleEffect(animateWhiteCircle ? 1 : 0)
            Image("ic-disabled")
            Image("ic-enabled")
                .offset(x: shake ? 5 : -5)
                .opacity(makeActive ? 1 : 0)
                .onAppear {
                    withAnimation(.linear(duration: 0.65).delay(0.9).repeatForever(autoreverses: true)) {
                        animateWhiteCircle.toggle()
                        makeActive.toggle()
                    }
                    withAnimation(.easeInOut(duration: 0.5).speed(6.0).repeatForever(autoreverses: true)) {
                        shake.toggle()
                    }
                }
                .shadow(radius: 10, x: 10, y: 15)
        }
    }
}

#Preview {
    VectorView()
}
