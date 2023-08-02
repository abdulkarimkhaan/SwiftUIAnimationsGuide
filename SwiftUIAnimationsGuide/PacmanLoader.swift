//
//  PacmanLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 31/07/2023.
//

import SwiftUI

struct PacMan: View {
    @State private var loginUser = false
    @State private var isMouthOpen = false
    @State private var animateBounty = false
    @State private var eatenBounty = false
    @State private var timeForNewBounty = 1.0

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
                
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
                    .animation(.spring(), value: animateBounty)
                    .offset(x: animateBounty ? 30 : 200, y: 0)
                    .opacity(eatenBounty ? 0 : 1)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                    isMouthOpen.toggle()
                }
                Timer.scheduledTimer(withTimeInterval: timeForNewBounty, repeats: false) { timer in
                    animateBounty.toggle()
                }
                Timer.scheduledTimer(withTimeInterval: timeForNewBounty + 0.3, repeats: false) { timer in
                    eatenBounty.toggle()
                }
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

//struct PacmanLoader_Previews: PreviewProvider {
//    static var previews: some View {
//        PacmanLoader()
//    }
//}
