//
//  ItineraryView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct ItineraryContainer: View {

    let tour: Tour // enum

    var body: some View {
        // switch on tour to present different views
        Text(tour.tourOption?.rawValue ?? "tour option nil")
    }
    
    // TODO: set blocks of views - st malo stops, st malo, manila village stops, manila village, use tour enum to figure out entry and exit points aka navigation links for each one.
    // st malo stops will always exit to st malo, manila village stops will always exit to manila village.
    // st malo can come after itinerary (st malo no stops), st malo stops, manila village, or manila village
        // can exit to manila village (both no stops), manila village stops (both all stops), or end of app/community share (st malo w or w/o stops)
    // same with manila village
    // the one that comes first when you go to both is a, the one that goes second is b. a stops will always enter after itinerary, b location will always exit to end of app/community share
}

#Preview {
    ItineraryContainer(tour: Tour(tourStop: .allStops, tourLocation: .both))
}
