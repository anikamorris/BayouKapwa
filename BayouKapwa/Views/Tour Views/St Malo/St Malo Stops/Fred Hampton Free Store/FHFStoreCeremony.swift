//
//  FHFStoreCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct FHFStoreCeremony: View {
    var body: some View {
        VStack {
            Text("Ceremony")
            NavigationLink("Finished") {
                FHFStoreStop()
            }
        }
    }
}

#Preview {
    FHFStoreCeremony()
}
