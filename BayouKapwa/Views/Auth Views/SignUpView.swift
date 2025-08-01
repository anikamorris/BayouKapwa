//
//  SignUpView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct SignUpView: View {

    @StateObject private var viewModel = SignUpViewModel()
    @Binding var showAuthView: Bool
    @State private var showError: Bool = false

    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            SecureField("Confirm password...", text: $viewModel.confirmedPassword)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        showAuthView = false
                    } catch {
                        showError = true
                    }
                }
            } label: {
                Text("Create Account")
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
        .alert(isPresented: $viewModel.hasErrors) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage()),
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

    private func errorMessage() -> String {
        switch viewModel.error {
        case .oneOrMoreFieldsEmpty: return "Please enter all fields"
        case .passwordsDoNotMatch: return "Passwords do not match"
        case .invalidEmail: return "Invalid email"
        case .userAlreadyExists: return "This email is already in use"
        default: return "Please try again"
        }
    }

}
