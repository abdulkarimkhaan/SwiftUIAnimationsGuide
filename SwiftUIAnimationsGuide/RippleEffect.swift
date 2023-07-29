//
//  SquareLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 29/07/2023.
//

import SwiftUI

struct RippleEffect: View {
    @State private var animate = false
    @State var currentTrim = 0.0
    @State var angleRotation = 0
    
    @State var widthRipple1 = 250.0
    @State var heightRipple1 = 250.0
    
    @State var widthRipple2 = 260.0
    @State var heightRipple2 = 260.0
    
    @State var widthRipple3 = 270.0
    @State var heightRipple3 = 270.0
    
    @State var widthRipple4 = 280.0
    @State var heightRipple4 = 280.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .fill(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                .frame(width: widthRipple1, height: heightRipple1)
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .fill(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                .frame(width: widthRipple2, height: heightRipple2)
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .fill(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                .frame(width: widthRipple3, height: heightRipple3)
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .fill(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                .frame(width: widthRipple4, height: widthRipple4)
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 30))
                .fill(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                .frame(width: 150, height: 150)
            
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 30))
                .fill(Color(red: 0.28, green: 0.05, blue: 0.66, opacity: 0.20))
                .frame(width: 100, height: 100)
        }
        .onAppear {
            animate.toggle()
            
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                widthRipple1 += 2
                heightRipple1 += 2
                
                widthRipple2 += 4
                heightRipple2 += 4
                
                widthRipple3 += 6
                heightRipple3 += 6
                
                widthRipple4 += 8
                heightRipple4 += 8

                if widthRipple1 > 600 {
                    widthRipple1 = 250.0
                    heightRipple1 = 250.0

                    widthRipple2 = 260.0
                    heightRipple2 = 260.0
                    
                    widthRipple3 = 270.0
                    heightRipple3 = 270.0
                    
                    widthRipple4 = 280.0
                    heightRipple4 = 280.0
                }
            }
        }
        .animation(.easeInOut.speed(0.6), value: animate)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        RippleEffect()
//    }
//}
