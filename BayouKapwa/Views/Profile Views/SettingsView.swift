//
//  SettingsView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/12/25.
//

import SwiftUI

struct SettingsView: View {

    @StateObject private var viewModel = ProfileViewModel()
    @State private var showPasswordResetAlert: Bool = false
    @State private var showError: Bool = false
    @Binding var showAuthView: Bool
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
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
            .buttonStyle(IntroButton())
            .padding(.bottom, 24)
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
            .buttonStyle(IntroButton())
            .padding(.bottom, 24)
        }
        .padding()
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
