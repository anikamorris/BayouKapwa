//
//  TourStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import Foundation

struct TourStop {
    let name: String
    let shortDescription: String?
    let address: String?

    init(from navLocation: NavigationLocation) {
        switch navLocation {
        case .fhfsIntro, .fhfsCeremony, .fhfsStop:
            name = "Fred Hampton Free Store"
            shortDescription = nil
            address = "5523 St Claude Ave, New Orleans, LA 70117"
        case .chtfbIntro, .chtfbCeremony, .chtfbStop:
            name = "Coffeehouse and \nTwo Fish Books"
            shortDescription = nil
            address = "7265 St Claude Ave, Arabi, LA 70032"
        case .losIslenosIntro, .losIslenosCeremony, .losIslenosStop:
            name = "Los Isleños Museum Complex"
            shortDescription = nil
            address = "1357 Bayou Rd, St Bernard, LA 70085"
        case .stMaloMarkerIntro, .stMaloMarkerStop:
            name = "Saint Malo Historical Marker"
            shortDescription = nil
            address = nil
        case .shellBeachIntro, .shellBeachCeremony, .shellBeachStop:
            name = "Shell Beach"
            shortDescription = nil
            address = "1301 Yscloskey Hwy, St Bernard, LA 70085"
        default:
            name = "error"
            shortDescription = "error"
            address = "error"
        }
    }
}
