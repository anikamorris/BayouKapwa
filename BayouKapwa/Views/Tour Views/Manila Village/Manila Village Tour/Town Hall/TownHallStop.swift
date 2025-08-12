//
//  TownHallStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct TownHallStop: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Jean Lafitte Town Hall")
            Text("Placeholder Description")
            Button("Next stop") {
                path.append(TourNavigationValue(navLocation: .natureTraceIntro, tour: nil))
            }
        }
    }

}
