//
//  ManilaVillageMarkerCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct ManilaVillageMarkerCeremony: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Ceremony")
            Button("Finished") {
                path.append(NavigationValue(navLocation: .manilaVillageMarkerStop, tour: nil))
            }
        }
    }

}
