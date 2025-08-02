//
//  ProfileViewModel.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""

    init() {
        Task {
            do {
                let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
                guard let name = authUser.name, let email = authUser.email else {
                    self.name = ""
                    self.email = ""
                    return
                }
                self.name = name
                self.email = email
            } catch {
                self.name = ""
                self.email = ""
            }
        }
    }

    func sendPasswordReset() async throws {
        try await AuthenticationManager.shared.sendPasswordReset(email: email)
    }

}
