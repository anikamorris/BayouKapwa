//
//  StMaloMarkerIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct StMaloMarkerIntro: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Saint Malo Historical Marker")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Text("Where to walk and considerations for your walk")
            Spacer()
            Button("I'm at the marker") {
                path.append(NavigationValue(navLocation: .stMaloMarkerStop, tour: nil))
            }
            .padding()
        }
        .padding()
    }

}
