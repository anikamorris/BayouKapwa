//
//  ContentView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct WelcomeView: View {

    @State private var path = NavigationPath()
    @Binding var showAuthView: Bool

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
            Button("Let's go") {
                path.append(NavigationValue(navLocation: .introView, tour: nil))
            }
            Button("Sign out") {
                Task {
                    do {
                        try AuthenticationMangager.shared.signOut()
                        showAuthView = true
                    } catch {
                        print("sign out failed")
                    }
                }
            }
        }
        .padding()
    }

}
