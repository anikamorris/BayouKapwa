//
//  ProfileView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel = ProfileViewModel()
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            if let user = viewModel.user {
                Text(user.name)
                    .font(.title)
                    .padding()
            }
            NavigationLink(value: ProfileNavigationValue(navLocation: .newPost)) {
                Text("New Post")
                    .padding()
            }
            NavigationLink(value: ProfileNavigationValue(navLocation: .settings)) {
                Text("Settings")
                    .padding()
            }
            Spacer()
        }
        .padding()
        .task {
            try? await viewModel.fetchUserData()
        }
    }

}
