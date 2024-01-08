//
//  BottomContentView.swift
//  SomethingWentWrongAnimation
//
//  Created by Abdul Karim Khan on 21/12/2023.
//

import SwiftUI

struct BottomContentView: View {
    var body: some View {
        Text("Oops!")
            .font(.largeTitle)
            .bold()
        Text("Look like something went wrong!")
        Button {
            print("Back")
        } label: {
            Text("Back")
                .padding()
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .font(.callout)
                .bold()
        }
        .shadow(color: .black, radius: 8, y: 5)
        .padding(.top, 40)
    }
}

#Preview {
    BottomContentView()
}
