//
//  LosIslenosStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct LosIslenosStop: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Los Isleños Museum Complex")
            Text("Placeholder Description")
            Button("Next stop") {
                path.append(TourNavigationValue(navLocation: .stMaloMarkerIntro, tour: nil))
            }
        }
    }

}
