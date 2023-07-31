//
//  TopBannerAnimate.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 30/07/2023.
//

import SwiftUI

struct TopBannerAnimate: View {
    @State private var show = false
    @State private var height = 600.0
    @State private var animateWelcome = false
    @State private var animateLoading = false
    @State private var counter = 5

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                    .frame(width: geometry.size.width, height: 600)
                    .animation(.spring(), value: show)
                    .offset(y: show ? 600 : -600)
                Text("Welcome Abdul Karim")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                    .animation(.spring(), value: animateWelcome)
                    .offset(x: animateWelcome ? -15 : -400, y: 350)
                Text("Loading...")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                    .animation(.spring(), value: animateLoading)
                    .offset(x: animateLoading ? -110 : -400, y: 400)
                CircleLoader(speedOfLoader: 0.01)
                    .opacity(show ? 1 : 0)
                Text("Hello Abdul!")
                    .foregroundColor(Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55))
                    .bold()
                    .font(.largeTitle)
                    .opacity(!show ? 1 : 0)
                    .animation(.spring(), value: animateWelcome)
            }
        }
        .onAppear {
            show.toggle()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                animateWelcome.toggle()
            }
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                animateLoading.toggle()
            }
            Timer.scheduledTimer(withTimeInterval: 9, repeats: false) { timer in
                animateWelcome.toggle()
            }
            Timer.scheduledTimer(withTimeInterval: 9.5, repeats: false) { timer in
                animateLoading.toggle()
            }
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { timer in
                show.toggle()
            }
        }
    }
}

struct TopBannerAnimate_Previews: PreviewProvider {
    static var previews: some View {
        TopBannerAnimate()
            .ignoresSafeArea()
    }
}
