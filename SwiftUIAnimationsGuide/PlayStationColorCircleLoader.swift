//
//  PlayStationLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 03/08/2023.
//

import SwiftUI

struct DayNightView: View {
    @State private var isDaytime = false

    var body: some View {
        ZStack {
            // Background color changes based on daytime
            LinearGradient(gradient: Gradient(colors: [isDaytime ? .blue : .black, isDaytime ? .white : .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)


            // Sun and Moon
            Circle()
                .fill(isDaytime ? Color.yellow : Color.white)
                .frame(width: 60, height: 60)
                .offset(y: 400)
                .rotationEffect(isDaytime ? Angle.degrees(180) : Angle.degrees(-180))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: true))
        }
        .onAppear {
            // Start the animation when the view appears
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                isDaytime.toggle()
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            DayNightView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct PulseHeartLoader_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
