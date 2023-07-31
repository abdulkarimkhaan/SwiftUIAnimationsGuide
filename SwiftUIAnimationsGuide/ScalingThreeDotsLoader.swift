//
//  ScalingThreeDotsLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 31/07/2023.
//

import SwiftUI

struct ScalingThreeDotsLoader: View {
    @State private var isAnimating = false
    @State var foregroundColor = Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55)
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .frame(width: 20, height: 20)
                    .scaleEffect(isAnimating ? 1.0 : 0.5) // Scale up when isAnimating is true, otherwise scale down
                    .animation(Animation.easeInOut(duration: 0.8).repeatForever().delay(0.3 * Double(index)), value: UUID())
                    .foregroundColor(foregroundColor)
            }
        }
        .onAppear {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        withAnimation {
            isAnimating = true
        }
    }
}

struct ScalingThreeDots: View {
    var body: some View {
        VStack {
            ScalingThreeDotsLoader()
        }
        .padding()
    }
}
//
//struct ScalingThreeDots_Previews: PreviewProvider {
//    static var previews: some View {
//        ScalingThreeDots()
//    }
//}
