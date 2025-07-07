//
//  ManilaVillageMarkerStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct ManilaVillageMarkerStop: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Manila Village Historical Marker")
            Text("Placeholder Description")
            Button("Next stop") {
                path.append(NavigationValue(navLocation: .multipurposeCenterIntro, tour: nil))
            }
        }
    }

}
