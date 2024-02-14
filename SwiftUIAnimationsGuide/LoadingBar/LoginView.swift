//
//  LoginView.swift
//  SwiftUIAnimationsGuide
//
//  Created by Abdul Karim Khan on 13/02/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        VStack (spacing: 50) {
            VStack {
                Image("ic-logo")
                    .resizable()
                    .frame(width: 175, height: 175)
                    .shadow(radius: 10)
                Text("Game.App")
                    .font(.system(size: 52))
                    .foregroundStyle(.white)
                    .bold()
                    .shadow(radius: 10)
            }
            VStack (spacing: 24) {
                TextField("Email", text: $firstName)
                    .padding(.horizontal, 30)
                    .font(.system(size: 24))
                    .frame(width: 360, height: 60)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(radius: 10)
                TextField("Password", text: $lastName)
                    .padding(.horizontal, 30)
                    .font(.system(size: 24))
                    .frame(width: 360, height: 60)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(radius: 10)
            }
            
            Button(action: {
                
            }, label: {
                Text("Login")
                    .bold()
                    .font(.system(size: 24))
            })
            .frame(width: 300, height: 70)
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 35))
            .shadow(radius: 10)
        }
    }
}
