//
//  SignInViewModel.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import Foundation

enum SignInError: Error {
    case oneOrMoreFieldsEmpty
    case emailIsEmpty
}


@MainActor
final class SignInViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: SignInError? = nil
    @Published var hasErrors: Bool = false

    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            hasErrors = true
            error = .oneOrMoreFieldsEmpty
            return
        }
        let returnedUserData = try await AuthenticationManager.shared.signInUser(
            email: email,
            password: password
        )
        print(returnedUserData)
    }

    func sendPasswordReset() async throws {
        guard !email.isEmpty else {
            hasErrors = true
            error = .emailIsEmpty
            return
        }
        try await AuthenticationManager.shared.sendPasswordReset(email: email)
    }

}
