//
//  DownloadButton.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 05/09/2023.
//

import SwiftUI

enum DownloadState: String {
    case InComplete = "Download"
    case InProgress = "Downloading"
    case Completed = "Download Complete"
}

struct TickShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - 5, y: rect.maxY - 10))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + 10))
        return path
    }
}

struct WaveAnimation: Shape {
    
    var progress: CGFloat
    var waveHeight: CGFloat
    var offset: CGFloat
    
    @State var fillLevelWave: CGFloat

    var animatableData: CGFloat {
        get {
            offset
        }
        
        set {
            offset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to: .zero)
            
            let progressHeight: CGFloat = (1 - progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2) {
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x, y: y - fillLevelWave + 60))
            }
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
        }
    }
}

struct DownloadButton: View {
    
    @State private var fillLevel: CGFloat = 0.0
    @State private var percentageLevel: CGFloat = 0.0
    
    //Circles to animate on download button tap
    @State private var circleWidth: CGFloat = 0.0
    @State private var circleHeight: CGFloat = 0.0
    @State private var circleWidth1: CGFloat = 0.0
    @State private var circleHeight1: CGFloat = 0.0

    @State var offset: CGFloat = 0.0
    @State var fillLevelWave = 0.0
    
    @State var downloadProgress: DownloadState = .InComplete
    
    var body: some View {
        ZStack {
            Color(red: 37/255, green: 43/255, blue: 54/255).edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30) {
                ZStack {
                    
                    //Animate inner circle when download button tapped
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 10))
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color(red: 137/255, green: 185/255, blue: 63/255))
                    
                    Circle()
                        .frame(width: circleWidth, height: circleHeight)
                        .foregroundColor(Color(red: 137/255, green: 185/255, blue: 63/255))
                        .animation(.easeOut.speed(1), value: circleWidth)
                    
                    Circle()
                        .frame(width: circleWidth1 - 10, height: circleHeight1 - 10)
                        .foregroundColor(Color(red: 37/255, green: 43/255, blue: 54/255))
                        .animation(.easeOut.speed(0.5), value: circleWidth1)
                    
                    
                    //progress 0.4 to 0.6
                    WaveAnimation(progress: 0.4, waveHeight: 0.03, offset: offset, fillLevelWave: fillLevelWave)
                        .fill(Color(red: 137/255, green: 185/255, blue: 63/255))
                        .frame(width: 150, height: 150)
                        .mask {
                            Circle()
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color(red: 137/255, green: 185/255, blue: 63/255))
                        }
                        .onAppear {
                            withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                                offset = 150
                            }
                        }
                    
                    //Download button
                    
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 10))
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color(red: 137/255, green: 185/255, blue: 63/255))
                        .overlay(
                            Rectangle()
                                .scaleEffect(CGSize(width: 150, height: fillLevel), anchor: .bottom) // Scale height from the bottom
                                .foregroundColor(Color(red: 137/255, green: 185/255, blue: 63/255))
                                .cornerRadius(75.0)
                                .animation(.linear.speed(0.0005), value: fillLevel)
                        )
                    
                    Image(fillLevelWave > 0 ? "ic-download-black" : "ic-download-green")
                        .resizable()
                        .frame(width: 95, height: 95)
                        .opacity(percentageLevel == 100 ? 0 : 1)
                        .animation(.easeInOut(duration: 1), value: percentageLevel)
                    
                    TickShape()
                        .stroke(Color(red: 37/255, green: 43/255, blue: 54/255), lineWidth: 10)
                        .frame(width: 70, height: 70)
                        .opacity(percentageLevel == 100 ? 1 : 0)
                        .animation(.easeInOut(duration: 1), value: percentageLevel)
                    
                }
                .onTapGesture {
                    withAnimation {
                        downloadProgress = .InProgress
                        circleWidth = 150
                        circleHeight = 150
                        //                            fillLevel = 150
                        if circleWidth == 150 {
                            circleWidth1 = 150
                            circleHeight1 = 150
                        }
                    }
                    Timer.scheduledTimer(withTimeInterval: 0.080, repeats: true) { Timer in
                        if percentageLevel < 100 {
                            percentageLevel += 1
                        }
                        if percentageLevel == 100 {
                            downloadProgress = .Completed
                        }
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: 0.056, repeats: true) { Timer in
                        if fillLevelWave < 150 {
                            fillLevelWave += 1
                        }
                    }
                }
                .frame(width: 150, height: 150)
                
                
                VStack (spacing: 10) {
                    Text(downloadProgress.rawValue)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 30))
                        .animation(.easeIn(duration: 0.3), value: downloadProgress)
                    
                    HStack {
                        Text("\(percentageLevel, specifier: "%.0f")")
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                            .contentTransition(.numericText())
                        Text("%")
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                    }
                    .opacity(downloadProgress == .InProgress ? 1 : 0)
                }
            }
            
        }
        
        
    }
}

struct DownloadButtonAnimation: View {
    var body: some View {
        DownloadButton()
    }
}

struct DownloadButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButton()
    }
}
