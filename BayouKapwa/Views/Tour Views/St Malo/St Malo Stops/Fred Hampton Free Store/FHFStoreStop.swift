//
//  FHFStoreStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct FHFStoreStop: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Fred Hampton Free Store")
            Text("'Phantom Visions' Mural")
            Button("Next stop") {
                path.append(TourNavigationValue(navLocation: .chtfbIntro, tour: nil))
            }
        }
    }

}
