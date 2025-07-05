//
//  LosIslenosIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct LosIslenosIntro: View {
    var body: some View {
        VStack {
            Text("Los Isleños Museum Complex")
            Text("1357 Bayou Rd, St Bernard, LA 70085")
            Text("Hours")
            VStack {
                HStack {
                    Text("Weds - Sun")
                    Spacer()
                    Text("11am - 4pm")
                }
                HStack {
                    Text("Mon - Tues")
                    Spacer()
                    Text("Closed")
                }
            }
            .padding(.horizontal, 48)
            NavigationLink("I'm on my way") {
                LosIslenosCeremony()
            }
        }
    }
}

#Preview {
    LosIslenosIntro()
}
