//
//  FHFStoreCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct FHFStoreCeremony: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Ceremony")
            Button("Finished") {
                path.append(NavigationValue(navLocation: .fhfsStop, tour: nil))
            }
        }
    }
}
