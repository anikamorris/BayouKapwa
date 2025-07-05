//
//  LosIslenosCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct LosIslenosCeremony: View {
    var body: some View {
        VStack {
            Text("Ceremony")
            NavigationLink("Finished") {
                LosIslenosStop()
            }
        }
    }
}

#Preview {
    LosIslenosCeremony()
}
