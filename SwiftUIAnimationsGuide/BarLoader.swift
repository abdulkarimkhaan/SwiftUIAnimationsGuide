//
//  BarLoader.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 17/09/2023.
//



import SwiftUI

struct BarLoader: View {
    
    @State var height1 = 20.0
    @State var height2 = 30.0
    @State var height3 = 60.0
    @State var height4 = 40.0
    @State var height5 = 30.0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            HStack {
                RoundedRectangle(cornerRadius: 13.0)
                    .frame(width: 26, height: height1)
                    .foregroundColor(.white)
                    .animation(.easeInOut(duration: 0.25), value: height1)
                
                RoundedRectangle(cornerRadius: 13.0)
                    .frame(width: 26, height: height2)
                    .foregroundColor(.white)
                    .animation(.easeInOut(duration: 0.25), value: height2)

                RoundedRectangle(cornerRadius: 13.0)
                    .frame(width: 26, height: height3)
                    .foregroundColor(.white)
                    .animation(.easeInOut(duration: 0.25), value: height3)

                RoundedRectangle(cornerRadius: 13.0)
                    .frame(width: 26, height: height4)
                    .foregroundColor(.white)
                    .animation(.easeInOut(duration: 0.25), value: height4)

                RoundedRectangle(cornerRadius: 13.0)
                    .frame(width: 26, height: height5)
                    .foregroundColor(.white)
                    .animation(.easeInOut(duration: 0.25), value: height5)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { Timer in
                height1 = Double.random(in: 20..<70)
                height2 = Double.random(in: 20..<50)
                height3 = Double.random(in: 20..<40)
                height4 = Double.random(in: 20..<50)
                height5 = Double.random(in: 20..<70)
            }
        }
        
    }
}

struct BarLoaderView: View {
    var body: some View {
        BarLoader()
    }
}

struct BarLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        BarLoader()
    }
}
