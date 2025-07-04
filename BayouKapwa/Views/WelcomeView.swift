//
//  ContentView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Bayou Kapwa")
                    .font(.largeTitle)
                    .padding()
                Text("Welcome to your self-guided tour")
                    .padding()
                Spacer()
                NavigationLink {
                    IntroView()
                } label: {
                    Text("Let's go")
                        .font(.title2)
                }

            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
