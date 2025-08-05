//
//  SignUpViewModel.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import Foundation

enum SignUpError: Error {
    case oneOrMoreFieldsEmpty
    case passwordsDoNotMatch
    case invalidEmail
    case userAlreadyExists
    case other
}

@MainActor
final class SignUpViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""

    func signUp() async throws {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmedPassword.isEmpty else {
            throw SignUpError.oneOrMoreFieldsEmpty
        }
        guard email.isValidEmail() else {
            throw SignUpError.invalidEmail
        }
        guard password == confirmedPassword else {
            throw SignUpError.passwordsDoNotMatch
        }
        let localAuthDataResult = try await AuthenticationManager.shared.createNewUser(
            email: email,
            password: password
        )
        try await UserManager.shared.createNewUser(auth: localAuthDataResult, name: name)
    }

}
