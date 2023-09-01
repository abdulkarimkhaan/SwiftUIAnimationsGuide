//
//  TwitterX.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 30/07/2023.
//

import SwiftUI

struct XTopRightHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 250))
        return path
    }
}

struct XTopLeftHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 250))
        return path
    }
}

struct XBottomRightHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 500))
        return path
    }
}

struct XBottomLeftHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 500))
        return path
    }
}

struct XSecondTopLeftHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX + 20, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 20, y: 250))
        return path
    }
}

struct XSecondBottomRightHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX + 20, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 20, y: 500))
        return path
    }
}

struct TwitterX: View {
    @State var topRight = 45
    @State var bottomLeft = 45
    @State var topLeft = 225
    @State var bottomRight = 45
    @State var count = 100
    @State var opacity = 1
    
    @State var animateSecondLine = false

    var body: some View {
        ZStack {
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("TWITTER X")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                }
                .padding(.top, 100)
                
                ZStack {
                    XSecondTopLeftHand()
                        .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .square, lineJoin: .round, miterLimit: 8))
                        .foregroundColor(Color.white)
                        .rotationEffect(.init(degrees: Double(-45)))
                        .opacity(animateSecondLine ? Double(opacity) : 0)
                    XSecondBottomRightHand()
                        .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .square, lineJoin: .round, miterLimit: 8))
                        .foregroundColor(Color.white)
                        .rotationEffect(.init(degrees: Double(-45)))
                        .opacity(animateSecondLine ? Double(opacity) : 0)
                }
                .animation(.spring(), value: animateSecondLine)
                
               
                XTopRightHand()
                    .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .square, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(Color.white)
                    .rotationEffect(.init(degrees: Double(topRight)))
                XTopLeftHand()
                    .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .square, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(Color.white)
                    .rotationEffect(.init(degrees: Double(topLeft)))
                XBottomRightHand()
                    .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .square, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(Color.white)
                    .rotationEffect(.init(degrees: Double(bottomRight)))
                XBottomLeftHand()
                    .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .square, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(Color.white)
                    .rotationEffect(.init(degrees: Double(bottomLeft)))
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if topLeft != -45 {
                    topLeft -= 5
                } else {
                    animateSecondLine = true
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if bottomRight != -45 {
                    bottomRight -= 5
                }
            }
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if topLeft == -45 {
                    opacity = (Int.random(in: 3...10) / 10)
                }
            }
        }
    }
}

struct TwitterX_Previews: PreviewProvider {
    static var previews: some View {
        TwitterX()
    }
}
