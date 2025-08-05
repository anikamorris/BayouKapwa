//
//  ProfileViewModel.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import Foundation

enum ProfileError: Error {
    case couldNotFetchEmail
}

@MainActor
final class ProfileViewModel: ObservableObject {

    @Published private(set) var user: DBUser? = nil

    func fetchUserData() async throws {
        let localAuthDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(from: localAuthDataResult.id)
    }

    func sendPasswordReset() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            throw ProfileError.couldNotFetchEmail
        }
        try await AuthenticationManager.shared.sendPasswordReset(email: email)
    }

}
