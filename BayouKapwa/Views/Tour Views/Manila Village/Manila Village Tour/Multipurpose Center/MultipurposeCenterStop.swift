//
//  MultipurposeCenterStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct MultipurposeCenterStop: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Jean Lafitte Multipurpose Center")
            Text("Placeholder Description")
            Button("Next stop") {
                path.append(TourNavigationValue(navLocation: .townHallIntro, tour: nil))
            }
        }
    }

}
