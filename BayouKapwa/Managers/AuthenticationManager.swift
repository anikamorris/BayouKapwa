//
//  AuthenticationMangager.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import Foundation
import FirebaseAuth

struct LocalAuthDataResult {
    let id: String
    let name: String?
    let email: String?
    let photoUrl: String?

    init(user: User) {
        self.id = user.uid
        self.name = user.displayName
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

enum AuthError: Error {
    case noCurrentUser
}

final class AuthenticationManager {

    static let shared = AuthenticationManager()

    private init() { }

    func getAuthenticatedUser() throws -> LocalAuthDataResult {
        guard let user = Auth.auth().currentUser else {
            throw AuthError.noCurrentUser
        }

        return LocalAuthDataResult(user: user)
    }

    func createNewUser(email: String, password: String) async throws -> LocalAuthDataResult {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return LocalAuthDataResult(user: authDataResult.user)
    }

    func signInUser(email: String, password: String) async throws -> LocalAuthDataResult {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return LocalAuthDataResult(user: authDataResult.user)
    }

    func sendPasswordReset(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }

}
