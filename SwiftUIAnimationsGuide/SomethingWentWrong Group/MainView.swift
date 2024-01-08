//
//  ContentView.swift
//  SomethingWentWrongAnimation
//
//  Created by Abdul Karim Khan on 20/12/2023.
//

import SwiftUI

struct SomethingWentWrongAnimation: View {
    var body: some View {
        VStack (spacing: 60) {
            Spacer()
            VStack {
                VectorView()
            }
            VStack (spacing: 10) {
                BottomContentView()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SomethingWentWrongAnimation()
}
