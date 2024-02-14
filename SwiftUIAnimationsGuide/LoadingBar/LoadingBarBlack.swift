//
//  LoadingBar.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 10/02/2024.
//

import SwiftUI


struct LoadingBarBlack: View {
    
    @State var loadingProgress = 0.0
    @State var progressTimer: Timer?
    
    @State var percentage = 0
    @State var percentageTimer: Timer?
    
    @State var showLoading = true
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                HStack {
                    Text("LOADING...")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                        .opacity(percentage == 100 ? 100 : (showLoading ? 100 : 0))
                        .animation(.easeInOut, value: showLoading)
                    Spacer()
                    Text("\(percentage) %")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                        .contentTransition(.numericText(value: Double(percentage)))
                }
                .padding(.horizontal, 20)
                
                //Loading Bar
                HStack {
                    Spacer()
                    Capsule()
                        .stroke(style: .init(lineWidth: 2))
                        .foregroundStyle(.white)
                        .frame(width: 380, height: 40)
                        .overlay {
                            VStack(alignment: .leading) {
                                Capsule()
                                    .foregroundStyle(.white)
                                    .frame(width: loadingProgress)
                            }
                            .padding(8)
                            .padding(.horizontal, 8)
                            .frame(width: .greatestFiniteMagnitude)
                        }
                    Spacer()
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 10)) {
                    loadingProgress = 364.0
                }
                
                percentageTimer = Timer.scheduledTimer(withTimeInterval: 0.09, repeats: true) { Timer in
                    if percentage < 100 {
                        withAnimation (.bouncy) {
                            percentage += 1
                        }
                    } else {
                        percentageTimer?.invalidate()
                    }
                }
                
                progressTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { Timer in
                    if percentage < 100 {
                        withAnimation (.bouncy) {
                            showLoading.toggle()
                        }
                    } else {
                        progressTimer?.invalidate()
                    }
                }
            }
            .opacity(percentage > 98 ? 0 : 1)
            .animation(.easeInOut(duration: 0.5), value: percentage)
            
            LoginView()
                .scaleEffect(percentage > 99 ? 1 : 0)
                .animation(.easeInOut(duration: 1.2), value: percentage)
        }
        .background(.black)
    }
}

struct LoadingBarBlack_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBarBlack()
    }
}
