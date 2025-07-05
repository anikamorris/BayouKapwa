//
//  FHFStoreStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct FHFStoreStop: View {
    var body: some View {
        VStack {
            Text("Fred Hampton Free Store")
            Text("'Phantom Visions' Mural")
            NavigationLink("Next stop") {
                CHTFBooksIntro()
            }
        }
    }
}

#Preview {
    FHFStoreStop()
}
