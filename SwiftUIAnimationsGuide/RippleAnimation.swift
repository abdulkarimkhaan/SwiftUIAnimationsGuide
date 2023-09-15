//
//  RippleAnimation.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 14/09/2023.
//

import SwiftUI

enum CallState {
    case Disconnected
    case Calling
}

struct CallingAnimation: View {
    
    @State private var scale: CGFloat = 1.0
    @State private var scale1: CGFloat = 1.0
    @State private var scale2: CGFloat = 1.0
    
    @State private var width: CGFloat = 100
    @State private var colorWave: Color = Color(red: 255/255, green: 252/255, blue: 84/255)
    @State var state: CallState = .Disconnected
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
                ZStack {
                    Circle()
                        .foregroundColor(colorWave.opacity(0.3))
                        .frame(width: width, height: width)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: scale)
                    Circle()
                        .foregroundColor(colorWave.opacity(0.3))
                        .frame(width: width, height: width)
                        .scaleEffect(scale1)
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: scale1)
                    Circle()
                        .foregroundColor(colorWave.opacity(0.3))
                        .frame(width: width, height: width)
                        .scaleEffect(scale2)
                        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: scale2)
                    
                    
                    Image("ic-profile")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(50)
                        .onTapGesture {
                            if state == .Disconnected {
                                state = .Calling
                                withAnimation {
                                    self.scale = 1.4 // Start with a slightly larger scale
                                    self.scale1 = 1.6 // Start with a slightly larger scale
                                    self.scale2 = 2.0 // Start with a slightly larger scale
                                }
                            } else {
                                state = .Disconnected
                            }
                        }
            }
        }
    }
}

struct Calling: View {
    var body: some View {
        CallingAnimation()
    }
}

struct Calling_Previews: PreviewProvider {
    static var previews: some View {
        CallingAnimation()
    }
}
