//
//  ContentView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct WelcomeView: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
            Text("Welcome to your self-guided tour")
                .padding()
            Spacer()
            Button {
                path.append(NavigationValue(navLocation: .introView, tour: nil))
            } label: {
                Text("Let's Go")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }

}
