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
            Button("Let's Go") {
                path.append(TourNavigationValue(navLocation: .introView, tour: nil))
            }
            .buttonStyle(IntroButton())
            .padding(.bottom, 24)
        }
        .padding()
    }

}
