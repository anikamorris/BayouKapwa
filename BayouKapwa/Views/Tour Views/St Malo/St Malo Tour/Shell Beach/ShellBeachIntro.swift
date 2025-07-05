//
//  ShellBeachIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct ShellBeachIntro: View {
    var body: some View {
        VStack {
            Text("Shell Beach")
                .font(.largeTitle)
                .padding()
            Text("Placeholder description")
            Spacer()
            NavigationLink("I'm on my way") {
                ShellBeachCeremony()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ShellBeachIntro()
}
