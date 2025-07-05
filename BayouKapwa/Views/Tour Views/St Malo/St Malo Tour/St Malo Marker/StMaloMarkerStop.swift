//
//  StMaloMarkerStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct StMaloMarkerStop: View {
    var body: some View {
        VStack {
            Text("Saint Malo Historical Marker")
            Text("Placeholder description")
            NavigationLink("Next stop") {
                ShellBeachIntro()
            }
        }
    }
}

#Preview {
    StMaloMarkerStop()
}
