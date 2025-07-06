//
//  StMaloMarkerStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct StMaloMarkerStop: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Saint Malo Historical Marker")
            Text("Placeholder description")
            Button("Next stop") {
                path.append(NavigationValue(navLocation: .shellBeachIntro, tour: nil))
            }
        }
    }

}
