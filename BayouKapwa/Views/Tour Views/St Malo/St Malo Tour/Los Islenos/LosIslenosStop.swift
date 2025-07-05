//
//  LosIslenosStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct LosIslenosStop: View {
    var body: some View {
        VStack {
            Text("Los Isleños Museum Complex")
            Text("Placeholder Description")
            NavigationLink("Next stop") {
                StMaloMarkerIntro()
            }
        }
    }
}

#Preview {
    LosIslenosStop()
}
