//
//  LosIslenosCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct LosIslenosCeremony: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Ceremony")
            Button("Finished") {
                path.append(TourNavigationValue(navLocation: .losIslenosStop, tour: nil))
            }
        }
    }

}
