//
//  AuthView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct AuthView: View {

    @Binding var showAuthView: Bool

    var body: some View {
        VStack {
            Text("Bayou Kapwa")
                .font(.title)
                .padding()
            NavigationLink(destination: SignInView(showAuthView: _showAuthView)) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.5, green: 0.64, blue: 0.36))
                    .cornerRadius(10)
            }
            NavigationLink(destination: SignUpView(showAuthView: _showAuthView)) {
                Text("Create Account")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.5, green: 0.64, blue: 0.36))
                    .cornerRadius(10)
            }
        }
        .padding()
    }

}
