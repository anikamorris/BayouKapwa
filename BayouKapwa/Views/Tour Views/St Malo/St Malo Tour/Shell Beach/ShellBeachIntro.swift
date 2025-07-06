//
//  ShellBeachIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct ShellBeachIntro: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Shell Beach")
                .font(.title)
                .padding()
            Text("Placeholder description")
            Spacer()
            Button("I'm on my way") {
                path.append(NavigationValue(navLocation: .shellBeachCeremony, tour: nil))
            }
            .padding()
        }
        .padding()
    }

}
