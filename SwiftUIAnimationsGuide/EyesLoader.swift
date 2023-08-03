//
//  EyesLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 02/08/2023.
//

import SwiftUI

struct Eyes: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            
            
            HStack (spacing: 30){
                Capsule()
                    .frame(width: 100, height: isAnimating ? 0 : 50)
                    .foregroundColor(.white)
                    .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                    .overlay(
                        Circle()
                            .frame(width: 20, height: 20)
                    )
                
                Capsule()
                    .frame(width: 100, height: isAnimating ? 0 : 50)
                    .foregroundColor(.white)
                    .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                    .overlay(
                        Circle()
                            .frame(width: 20, height: 20)
                    )
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct EyesLoader: View {
    var body: some View {
        ZStack {
            Color.black // Background color
            VStack (spacing: 20){
                Eyes()
            }
        }
        .ignoresSafeArea()
    }
}

//struct EyesLoader_Previews: PreviewProvider {
//    static var previews: some View {
//        EyesLoader()
//    }
//}
