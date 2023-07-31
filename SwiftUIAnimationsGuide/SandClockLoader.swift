//
//  SandClockLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 30/07/2023.
//

import SwiftUI

struct SandClockLoader: View {
    @State private var flip = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack (spacing: -80) {
                    Triangle()
                        .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round, miterLimit: 8))
                        .frame(width: 100, height: 150)
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: 180))
                    
                    Triangle()
                        .frame(width: 100, height: 150)
                        .foregroundColor(.black)
                }
                .rotationEffect(.degrees(flip ? -180 : 180))
                .animation(Animation.linear(duration: 5).repeatForever())
            }
        }
        .onAppear {
            flip.toggle()
        }
    }
}

//struct SandClockLoader_Previews: PreviewProvider {
//    static var previews: some View {
//        SandClockLoader()
//            .padding()
//            .frame(width: 100, height: 300)
//    }
//}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
