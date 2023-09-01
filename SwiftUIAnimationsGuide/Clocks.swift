//
//  Clocks.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 29/07/2023.
//

import SwiftUI

struct SecondsHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 250))
        return path
    }
}

struct MinutesHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 240))
        return path
    }
}

struct HoursHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 300))
        return path
    }
}


struct Clocks: View {
    @State var angleRotationSeconds = 0
    @State var angleRotationMinutes = -40
    @State var angleRotationHours = 50
    
    @State var seconds = 0.1
    @State var minutes = 6.0
    @State var hours = 36.0

    var body: some View {
        ZStack {
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 10))
                    .fill(Color(red: 1, green: 1, blue: 1, opacity: 1))
                    .frame(width: 350, height: 350)
                SecondsHand()
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(Color.white)
                    .rotationEffect(.init(degrees: Double(angleRotationSeconds)))
                MinutesHand()
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(Color.white)
                    .rotationEffect(.init(degrees: Double(angleRotationMinutes)))
                HoursHand()
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(Color.white)
                    .rotationEffect(.init(degrees: Double(angleRotationHours)))
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: seconds, repeats: true) { timer in
                angleRotationSeconds += 1
            }
            Timer.scheduledTimer(withTimeInterval: minutes, repeats: true) { timer in
                angleRotationMinutes += 1
            }
            Timer.scheduledTimer(withTimeInterval: hours, repeats: true) { timer in
                angleRotationHours += 1
            }
        }
    }
}

struct Clocks_Previews: PreviewProvider {
    static var previews: some View {
        Clocks()
    }
}
