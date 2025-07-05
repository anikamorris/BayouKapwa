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
            Text("Fred Hampton Free Store")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top)
            Text("5523 St Claude Ave, New Orleans, LA 70117")
                .padding(.top, 2)
                .padding(.bottom)
            Text("Placeholder description")
            Spacer()
            NavigationLink("Skip this stop") {
                CHTFBooksIntro()
            }
            .padding()
            NavigationLink("Will make this stop") {
                FHFStoreCeremony()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    FHFStoreIntro()
}
