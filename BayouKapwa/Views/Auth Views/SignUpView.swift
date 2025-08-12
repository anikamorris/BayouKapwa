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
    @State private var error: SignUpError = .other

    var body: some View {
        VStack {
            TextField("Name...", text: $viewModel.name)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            TextField("Email...", text: $viewModel.email)
                .textInputAutocapitalization(.never)
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
                    } catch(let error) {
                        guard let error = error as? SignUpError else {
                            return
                        }
                        self.error = error
                        showError = true

                    }
                }
            } label: {
                Text("Create Account")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.5, green: 0.64, blue: 0.36))
                    .cornerRadius(10)
            }
            .padding(.top)
            Spacer()
        }
        .padding()
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Something went wrong"),
                message: Text(errorMessage()),
                dismissButton: .cancel(Text("OK"))
            )
        }
    }

    private func errorMessage() -> String {
        switch error {
        case .oneOrMoreFieldsEmpty: return "Please enter all fields"
        case .passwordsDoNotMatch: return "Passwords do not match"
        case .invalidEmail: return "Invalid email"
        case .userAlreadyExists: return "This email is already in use"
        default: return "Please try again"
        }
    }

}
