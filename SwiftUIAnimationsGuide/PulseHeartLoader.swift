//
//  PulseHeartLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 03/08/2023.
//

import SwiftUI

struct PulseHeart: View {
    @State private var isPulsating = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size: 100))
                .scaleEffect(isPulsating ? 1.5 : 1.0)
                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
        }
        .onAppear {
            isPulsating = true
        }
    }
}

struct PulseHeartLoader: View {
    var body: some View {
        PulseHeart()
    }
}

struct PulseHeartLoader_Previews: PreviewProvider {
    static var previews: some View {
        PulseHeart()
    }
}


