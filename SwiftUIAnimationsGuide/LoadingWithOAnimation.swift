//
//  LoadingWithOAnimation.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 03/09/2023.
//

import SwiftUI

struct LoadingWithOAnimation: View {
    
    @State var updateRotationEffect = 0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            HStack (spacing: 8) {
                Text("L")
                    .foregroundColor(.white)
                    .font(.system(size: 34))
                    .bold()
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 8))
                    .foregroundColor(.white.opacity(0.4))
                    .frame(width: 26, height: 26)
                    .overlay(
                        Circle()
                            .trim(from: 0, to: 0.4)
                            .stroke(style: StrokeStyle(lineWidth: 8))
                            .fill(.white)
                            .frame(width: 26, height: 26)
                            .rotationEffect(.init(degrees: Double(updateRotationEffect)))
                    )
               
                Text("ADING")
                    .foregroundColor(.white)
                    .font(.system(size: 34))
                    .bold()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.003, repeats: true) { Timer in
                updateRotationEffect += 1
            }
        }
    }
}

struct LoadingWithOAnimationLoader: View {
    var body: some View {
        LoadingWithOAnimation()
    }
}

struct LoadingWithOAnimationLoader_Previews: PreviewProvider {
    static var previews: some View {
        LoadingWithOAnimation()
    }
}
