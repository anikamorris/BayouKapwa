//
//  TourStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import Foundation

struct TourStop {
    let name: String
    let introDescription: String?
    let address: String?

    init(from navLocation: NavigationLocation) {
        switch navLocation {
        case .fhfsIntro, .fhfsCeremony, .fhfsStop:
            name = "Fred Hampton Free Store"
            introDescription = nil
            address = "5523 St Claude Ave, New Orleans, LA 70117"
        case .chtfbIntro, .chtfbCeremony, .chtfbStop:
            name = "The Coffeehouse and \nTwo Fish Books"
            introDescription = nil
            address = "7265 St Claude Ave, Arabi, LA 70032"
        case .losIslenosIntro, .losIslenosCeremony, .losIslenosStop:
            name = "Los Isleños Museum Complex"
            introDescription = nil
            address = "1357 Bayou Rd, St Bernard, LA 70085"
        case .stMaloMarkerIntro, .stMaloMarkerStop:
            name = "Saint Malo Historical Marker"
            introDescription = nil
            address = nil
        case .shellBeachIntro, .shellBeachCeremony, .shellBeachStop:
            name = "Shell Beach"
            introDescription = nil
            address = "1301 Yscloskey Hwy, St Bernard, LA 70085"
        case .manilaVillageMarkerIntro, .manilaVillageMarkerCeremony, .manilaVillageMarkerStop:
            name = "Manila Village Historical Marker"
            introDescription = nil
            address = nil
        case .multipurposeCenterIntro, .multipurposeCenterCeremony, .multipurposeCenterStop:
            name = "Jean Lafitte Multipurpose Center"
            introDescription = nil
            address = nil
        case .townHallIntro, .townHallCeremony, .townHallStop:
            name = "Jean Lafitte Town Hall"
            introDescription = nil
            address = nil
        case .natureTraceIntro, .natureTraceCeremony, .natureTraceStop:
            name = "Nature Wetland Trace"
            introDescription = nil
            address = nil
        default:
            name = "error"
            introDescription = "error"
            address = "error"
        }
    }
}
