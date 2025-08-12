//
//  ShellBeachCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct ShellBeachCeremony: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Ceremony")
            Button("Finished") {
                path.append(TourNavigationValue(navLocation: .shellBeachStop, tour: nil))
            }
        }
    }

}
