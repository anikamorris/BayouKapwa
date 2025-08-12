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
            Text("St. Malo Historical Marker")
            Text("Placeholder description")
            Button("Next stop") {
                path.append(TourNavigationValue(navLocation: .shellBeachIntro, tour: nil))
            }
        }
    }

}
