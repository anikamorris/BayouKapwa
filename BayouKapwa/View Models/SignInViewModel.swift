//
//  SignInViewModel.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import Foundation

@MainActor
final class SignInViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: SignUpError? = nil
    @Published var hasErrors: Bool = false

    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            hasErrors = true
            error = .oneOrMoreFieldsEmpty
            return
        }
        let returnedUserData = try await AuthenticationMangager.shared.signInUser(
            email: email,
            password: password
        )
        print(returnedUserData)
    }

}
