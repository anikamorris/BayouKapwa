//
//  MultipurposeCenterCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct MultipurposeCenterCeremony: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Ceremony")
            Button("Finished") {
                path.append(TourNavigationValue(navLocation: .multipurposeCenterStop, tour: nil))
            }
        }
    }

}
