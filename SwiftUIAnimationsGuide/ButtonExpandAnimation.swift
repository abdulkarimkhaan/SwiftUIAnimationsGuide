//
//  ButtonExpandAnimation.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 16/09/2023.
//

import SwiftUI

struct ButtonExpandAnimation: View {
    
    @State var height = 70.0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 35)
                            .frame(width: 70, height: height)
                            .foregroundColor(.white)
                            .animation(.interactiveSpring().speed(0.3), value: height)
                            .padding(40)
                        
                        VStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.yellow)
                                .padding(.top, 40)
                                .onTapGesture {
                                    withAnimation {
                                        if height == 230.0 {
                                            height = 70.0
                                        } else {
                                            height = 230.0
                                        }
                                    }
                                }
                            
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.yellow)
                                .opacity(height == 230.0 ? 1 : 0)
//                                .animation(.interactiveSpring().speed(0.1), value: width)
                            
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.yellow)
                                .opacity(height == 230.0 ? 1 : 0)
//                                .animation(.interactiveSpring().speed(0.1), value: width)
                            
                        }
                        
                    }
                    Spacer()
                }
                Spacer()
            }
            
                
        }
    }
}

struct ButtonExpandAnimationView: View {
    var body: some View {
        ButtonExpandAnimation()
    }
}

struct ButtonExpandAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExpandAnimation()
    }
}
