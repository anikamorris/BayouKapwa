//
//  ManilaVillageNoStopsItineraryView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct ManilaVillageNoStopsItineraryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Manila Village Historical Marker")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
            Text("Jean Lafitte Multipurpose Center")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
            Text("Jean Lafitte Town Hall")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
            Text("Nature Wetland Trace")
                .font(.title2)
                .padding(.top)
            Text("description")
                .padding(.leading)
        }
    }
}

#Preview {
    ManilaVillageNoStopsItineraryView()
}
