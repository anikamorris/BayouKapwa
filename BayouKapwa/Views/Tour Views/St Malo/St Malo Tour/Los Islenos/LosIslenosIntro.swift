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
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top)
            Text("1357 Bayou Rd, St Bernard, LA 70085")
                .padding(.top, 2)
                .padding(.bottom)
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
            .padding(.bottom)
            Text("Placeholder description")
            Spacer()
            NavigationLink("I'm on my way") {
                LosIslenosCeremony()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    LosIslenosIntro()
}
