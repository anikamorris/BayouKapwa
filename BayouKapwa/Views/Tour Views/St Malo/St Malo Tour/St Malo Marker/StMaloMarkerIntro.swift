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
                .font(.largeTitle)
                .padding()
            Text("Where to walk and considerations for your walk")
            Spacer()
            NavigationLink("I'm at the marker") {
                StMaloMarkerStop()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    StMaloMarkerIntro()
}
