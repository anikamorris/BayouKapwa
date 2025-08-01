//
//  ItineraryView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct ItineraryContainer: View {

    @Binding var path: NavigationPath
    let tour: Tour

    var body: some View {
        VStack {
            Text("Your Itinerary")
                .font(.largeTitle)
                .padding()
            switch tour.tourOption {
            case .allStopsManilaVillage:
                ManilaVillageWithStopsItineraryView()
            case .allStopsStMalo:
                StMaloWithStopsItineraryView()
            case .noStopsManilaVillage:
                ManilaVillageNoStopsItineraryView()
            case .noStopsStMalo:
                StMaloNoStopsItineraryView()
            case .none:
                Text(tour.tourOption?.rawValue ?? "tour option nil") // TODO: replace with error view
            }
            Spacer()
            Button("Next") {
                switch tour.tourOption {
                case .allStopsManilaVillage:
                    path.append(NavigationValue(navLocation: .emptyView, tour: nil))
                case .allStopsStMalo:
                    path.append(NavigationValue(navLocation: .fhfsIntro, tour: nil))
                case .noStopsManilaVillage:
                    path.append(NavigationValue(navLocation: .manilaVillageMarkerIntro, tour: nil))
                case .noStopsStMalo:
                    path.append(NavigationValue(navLocation: .losIslenosIntro, tour: nil))
                default:
                    path.append(NavigationValue(navLocation: .emptyView, tour: nil)) // TODO: replace with error view
                }
            }
        }
        .padding()
    }

    // next button goes to fhfs intro, los islenos intro, mv first stop intro, or mv intro
    
    // TODO: set blocks of views - st malo stops, st malo, manila village stops, manila village, use tour enum to figure out entry and exit points aka navigation links for each one.
    // st malo stops will always exit to st malo, manila village stops will always exit to manila village.
    // st malo can come after itinerary (st malo no stops), st malo stops, manila village, or manila village
        // can exit to manila village (both no stops), manila village stops (both all stops), or end of app/community share (st malo w or w/o stops)
    // same with manila village
    // the one that comes first when you go to both is a, the one that goes second is b. a stops will always enter after itinerary, b location will always exit to end of app/community share
}

