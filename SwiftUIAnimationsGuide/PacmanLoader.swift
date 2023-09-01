//
//  PacmanLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 31/07/2023.
//

import SwiftUI

struct PacMan: View {
    @State private var isMouthOpen = false
    @State private var animateMovement = false
    @State private var timeToStartMovement = 0.1
    @State private var speedOfPacman = 0.05

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Pac-Man
                Path { path in
                    path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2),
                                radius: geometry.size.width / 4,
                                startAngle: .degrees(isMouthOpen ? -30 : -1),
                                endAngle: .degrees(isMouthOpen ? 30 : 1),
                                clockwise: true)
                    
                    // Closing the mouth with a line
                    path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                    
                }
                .fill(Color.yellow)
                .animation(.spring().speed(speedOfPacman), value: animateMovement)
//                .offset(x: animateMovement ? 250 : -250, y: 0)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                    isMouthOpen.toggle()
                }
//                Timer.scheduledTimer(withTimeInterval: timeToStartMovement, repeats: false) { timer in
//                    animateMovement.toggle()
//                }
            }
        }
        
    }
}

struct PacmanLoader: View {
    var body: some View {
        ZStack {
            Color.black // Background color
            VStack {
                Text("PACMAN")
                    .font(.system(size: 50))
                    .foregroundColor(.yellow)
                    .bold()
                PacMan()
                    .frame(width: 200, height: 200)
            }
        }
        .ignoresSafeArea()
    }
}

struct PacmanLoader_Previews: PreviewProvider {
    static var previews: some View {
        PacmanLoader()
    }
}
