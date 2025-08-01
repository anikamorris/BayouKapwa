//
//  RolesView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/22/25.
//

import SwiftUI

struct RolesView: View {
    var body: some View {
        VStack {
            Text("Choose your role")
            Text("Text describing why we have the roles")
            Text("Navigator")
            Text("Navigator description")
            Text("Ceremonialist")
            Text("Ceremonialist description")
            Text("Documentarian")
            Text("Documentarian description")
            Button("Navigator") {
                // TODO: set role
            }
            .buttonStyle(.bordered)
            .padding()
            Button("Ceremonialist") {
                // TODO: set role
            }
            .buttonStyle(.bordered)
            .padding()
            Button("Documentarian") {
                // TODO: set role
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
}

#Preview {
    RolesView()
}
