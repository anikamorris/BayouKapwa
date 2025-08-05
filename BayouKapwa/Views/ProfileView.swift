//
//  ProfileView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel = ProfileViewModel()
    @State private var showPasswordResetAlert: Bool = false
    @State private var showError: Bool = false
    @Binding var showAuthView: Bool

    var body: some View {
        VStack {
            if let user = viewModel.user {
                Text(user.id)
                    .font(.title2)
                    .padding()
                Text(user.name)
                    .font(.title2)
                    .padding()
                Text(user.email)
            }
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.sendPasswordReset()
                        showPasswordResetAlert = true
                    } catch {
                        showError = true
                    }
                }
            }
            Button("Sign out") {
                Task {
                    do {
                        try AuthenticationManager.shared.signOut()
                        showAuthView = true
                    } catch {
                        showError = true
                    }
                }
            }
        }
        .padding()
        .task {
            try? await viewModel.fetchUserData()
        }
        .alert(isPresented: $showPasswordResetAlert) {
            Alert(
                title: Text("Password reset initiated"),
                message: Text("Check your email for a link to reset your password."),
                dismissButton: .cancel(Text("OK"))
            )
        }
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Something went wrong"),
                message: Text("Please try again"),
                dismissButton: .cancel(Text("OK"))
            )
        }
    }

}
