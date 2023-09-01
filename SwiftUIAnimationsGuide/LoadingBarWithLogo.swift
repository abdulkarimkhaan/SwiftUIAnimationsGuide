//
//  LoadingBarWithLogo.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 31/08/2023.
//

import SwiftUI

struct LoadingBarWithLogo: View {
    
    @State var progress = 0.0
    @State var progressCar = 0.0
    
    @State var scaleToHomeView = false

    var body: some View {
        ZStack (alignment: .leading) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("ic-car")
                    .resizable()
                    .frame(width: 150, height: 200)
                    .padding(.bottom, 80)
                    .offset(x: progressCar)
            }
            
            Rectangle()
                .fill(Color.white.opacity(0.3))
                .frame(height: 60)
            
            Rectangle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .foregroundColor(.white)
                .padding()
                .frame(height: 60)
            
            Rectangle()
                .fill(Color.white.opacity(scaleToHomeView ? 1 : 0.8))
                .frame(width: progress, height: 30)
                .padding()
                .scaleEffect(scaleToHomeView ? 30 : 1)
                .animation(.easeInOut(duration: 1), value: scaleToHomeView)
            
            Text("Hello World!")
                .opacity(scaleToHomeView ? 1 : 0)
                .font(.largeTitle)
                .bold()
                .padding(.leading, 100)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { Timer in
                if progress < 365 {
                    progress += 1
                }
                if progressCar < 500 {
                    progressCar += 1
                    if progressCar == 499 {
                        scaleToHomeView.toggle()
                    }
                }
            }
        }
    }
}

struct LoaderWithLogoView: View {
    var body: some View {
        LoadingBarWithLogo()
    }
}

struct LoaderWithLogoView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBarWithLogo()
    }
}
