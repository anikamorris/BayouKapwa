//
//  StMaloWithStopsItineraryView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct StMaloWithStopsItineraryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fred Hampton Free Store")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
            Text("Two Fish Books / Coffeehouse")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
            Text("Los Isleños Museum Complex")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
            Text("St. Malo Historical Marker")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
            Text("Shell Beach")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
        }
    }
}

#Preview {
    StMaloWithStopsItineraryView()
}
