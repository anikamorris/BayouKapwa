//
//  SignInView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct SignInView: View {

    @StateObject private var viewModel = SignInViewModel()
    @Binding var showAuthView: Bool
    @State private var showError: Bool = false
    @State private var showPasswordResetAlert: Bool = false

    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            Button {
                Task {
                    do {
                        try await viewModel.signIn()
                        showAuthView = false
                    } catch {
                        showError = true
                    }
                }
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top)
            Button {
                Task {
                    do {
                        try await viewModel.sendPasswordReset()
                        showPasswordResetAlert = true
                    } catch {
                        showError = true
                    }
                }
            } label: {
                Text("Forgot Password")
                    .padding()
            }
            Spacer()
        }
        .padding()
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Something went wrong"),
                message: Text("Please try again"),
                dismissButton: .cancel(Text("OK"))
            )
        }
        .alert(isPresented: $showPasswordResetAlert) {
            Alert(
                title: Text("Password reset initiated"),
                message: Text("Check your email for a link to reset your password."),
                dismissButton: .cancel(Text("OK"))
            )
        }
    }

}

