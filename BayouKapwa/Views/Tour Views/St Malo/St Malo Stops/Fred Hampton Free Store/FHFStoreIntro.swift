//
//  FHFStoreIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct FHFStoreIntro: View {
    var body: some View {
        VStack {
            Text("First Stop")
            Text("Fred Hampton Free Store")
            Text("5523 St Claude Ave, New Orleans, LA 70117")
            Text("Placeholder description")
            NavigationLink("Skip this stop") {
                CHTFBooksIntro()
            }
            NavigationLink("Will make this stop") {
                FHFStoreCeremony()
            }
        }
    }
}

#Preview {
    FHFStoreIntro()
}
