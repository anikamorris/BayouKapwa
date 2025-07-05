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
            Text("Placeholder description")
            NavigationLink("I'm on my way") {
                ShellBeachCeremony()
            }
        }
    }
}

#Preview {
    ShellBeachIntro()
}
