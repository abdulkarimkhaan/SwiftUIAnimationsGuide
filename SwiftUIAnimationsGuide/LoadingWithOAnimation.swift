//
//  LoadingWithOAnimation.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 03/09/2023.
//

import SwiftUI

struct LoadingWithOAnimation: View {
    
    @State var rotationDegree = 0.0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            HStack {
                Text("L")
                    .foregroundColor(.white)
                    .font(.system(size: 34))
                    .bold()
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 8))
                    .frame(width: 26, height: 26)
                    .foregroundColor(.white.opacity(0.4))
                    .overlay (
                        Circle()
                            .trim(from: 0, to: 0.3)
                            .stroke(style: StrokeStyle(lineWidth: 8))
                            .frame(width: 26, height: 26)
                            .foregroundColor(.white)
                            .rotationEffect(.init(degrees: rotationDegree))
                    )
                
                
                Text("ADING")
                    .foregroundColor(.white)
                    .font(.system(size: 34))
                    .bold()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { Timer in
                rotationDegree += 1
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
