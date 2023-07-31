//
//  ContentView.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 29/07/2023.
//

import SwiftUI

struct CircleLoader: View {
    @State var currentTrim = 0.2
    @State var angleRotation = -90
    
    @State var widthRipple1 = 250.0
    @State var heightRipple1 = 250.0
    @State var widthRipple2 = 260.0
    @State var heightRipple2 = 260.0
    
    @State var speedOfLoader = 0.02

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 30))
                .fill(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                .frame(width: 200, height: 200)
                .overlay(
                    Circle()
                        .trim(from: 0, to: currentTrim)
                        .stroke(style: StrokeStyle(lineWidth: 30))
                        .fill(Color(red: 0.51, green: 0.38, blue: 0.94))
                        .frame(width: 200, height: 200)
                        .rotationEffect(.init(degrees: Double(angleRotation)))
                )
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 30))
                .fill(Color(red: 0.28, green: 0.05, blue: 0.66, opacity: 0.20))
                .frame(width: 150, height: 150)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: speedOfLoader, repeats: true) { timer in
                angleRotation += 2
            }
        }
    }
}

struct CircleLoader_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoader()
    }
}
