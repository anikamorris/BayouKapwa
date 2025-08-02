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

    @Published var name: String = ""
    @Published var email: String = ""

    func sendPasswordReset() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            throw ProfileError.couldNotFetchEmail
        }
        try await AuthenticationManager.shared.sendPasswordReset(email: email)
    }

}
