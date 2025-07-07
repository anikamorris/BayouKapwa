//
//  NatureTraceStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct NatureTraceStop: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Nature Wetland Trace")
            Text("Placeholder Description")
            Button("Finish Tour") {
                path.append(NavigationValue(navLocation: .manilaVillageCompletionView, tour: nil))
            }
        }
    }

}
