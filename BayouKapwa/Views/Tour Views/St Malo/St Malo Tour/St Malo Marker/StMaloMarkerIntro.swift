//
//  StMaloMarkerIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct StMaloMarkerIntro: View {
    var body: some View {
        VStack {
            Text("Saint Malo Historical Marker")
            Text("Where to walk and considerations for your walk")
            NavigationLink("I'm at the marker") {
                StMaloMarkerStop()
            }
        }
    }
}

#Preview {
    StMaloMarkerIntro()
}
