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

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""
    @Published var hasErrors: Bool = false
    @Published var error: SignUpError? = nil

    func signUp(completion: @escaping () -> Void) {
        guard !email.isEmpty, !password.isEmpty, !confirmedPassword.isEmpty else {
            hasErrors = true
            error = .oneOrMoreFieldsEmpty
            return
        }
        guard password == confirmedPassword else {
            hasErrors = true
            error = .passwordsDoNotMatch
            return
        }
        // TODO: email validation
        Task {
            do {
                let returnedUserData = try await AuthenticationMangager.shared.createNewUser(
                    email: email,
                    password: password
                )
                print(returnedUserData)
                completion()
            } catch(let error) {
                print(error)
                hasErrors = true
            }
        }
    }

}
