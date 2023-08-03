//
//  JarFilledWithLiquid.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 03/08/2023.
//

import SwiftUI

struct PlayStationLoader: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black // Background color
            
            Group {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                    .offset(y: isAnimating ? -50 : 0)
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                    .offset(x: isAnimating ? 43 : 0, y: isAnimating ? 25 : 0)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .offset(x: isAnimating ? -43 : 0, y: isAnimating ? 25 : 0)
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 30, height: 30)
                    .offset(y: isAnimating ? 50 : 0)
            }
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct PlayStationColorCircleLoader: View {
    var body: some View {
        PlayStationLoader()
    }
}

struct PlayStationColorCircleLoader_Previews: PreviewProvider {
    static var previews: some View {
        PlayStationColorCircleLoader()
    }
}
