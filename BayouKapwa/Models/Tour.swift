//
//  TourOption.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

// TODO: add both back in on v2

enum TourStopOption: String, CaseIterable, Identifiable {
    case allStops = "All stops"
    case noStops = "Speed run"
    var id: Self { self }
}

enum TourLocation: String, CaseIterable, Identifiable {
    case manilaVillage = "Manila Village"
    case stMalo = "St. Malo"
    // case both = "Both"
    var id: Self { self }
}

enum TourOption: String {
    case allStopsManilaVillage = "Manila Village all stops"
    case allStopsStMalo  = "St. Malo all stops"
    // case allStopsBoth  = "Both all stops"
    case noStopsManilaVillage  = "Manila Village no stops"
    case noStopsStMalo = "St. Malo no stops"
    // case noStopsBoth = "Both no stops"
}

struct Tour: Hashable, Equatable {
    let tourStopOption: TourStopOption?
    let tourLocation: TourLocation?
    let tourOption: TourOption?

    // TODO: init uses stops and location to pull all stops and info
    init(tourStop: TourStopOption?, tourLocation: TourLocation?) {
        self.tourStopOption = tourStop
        self.tourLocation = tourLocation
        switch tourStop {
        case .allStops:
            switch tourLocation {
            case .manilaVillage: self.tourOption = .allStopsManilaVillage
            case .stMalo: self.tourOption = .allStopsStMalo
            // case .both: self.tourOption = .allStopsBoth
            case .none: self.tourOption = nil
            }
        case .noStops:
            switch tourLocation {
            case .manilaVillage: self.tourOption = .noStopsManilaVillage
            case .stMalo: self.tourOption = .noStopsStMalo
            // case .both: self.tourOption = .noStopsBoth
            case .none: self.tourOption = nil
            }
        case .none: self.tourOption = nil
        }
    }
}
