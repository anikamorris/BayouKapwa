//
//  ProfileView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct ProfileView: View {

    @StateObject var viewModel = ProfileViewModel()
    @Binding var showAuthView: Bool

    var body: some View {
        VStack {
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.sendPasswordReset()
                    } catch {
                        print("sign out failed")
                    }
                }
            }
            Button("Sign out") {
                Task {
                    do {
                        try AuthenticationManager.shared.signOut()
                        showAuthView = true
                    } catch {
                        print("sign out failed")
                    }
                }
            }
        }
        .padding()
    }

}
