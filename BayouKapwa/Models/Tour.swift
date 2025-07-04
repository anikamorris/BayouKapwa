//
//  TourOption.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

enum TourStop: String, CaseIterable, Identifiable {
    case allStops = "All stops"
    case noStops = "Speed run"
    var id: Self { self }
}

enum TourLocation: String, CaseIterable, Identifiable {
    case manilaVillage = "Manila Village"
    case saintMalo = "Saint Malo"
    case both = "Both"
    var id: Self { self }
}

enum TourOption: String {
    case allStopsManilaVillage = "Manila Village all stops"
    case allStopsSaintMalo  = "Saint Malo all stops"
    case allStopsBoth  = "Both all stops"
    case noStopsManilaVillage  = "Manila Village no stops"
    case noStopsSaintMalo = "Saint Malo no stops"
    case noStopsBoth = "Both no stops"
}

struct Tour {
    let tourStop: TourStop?
    let tourLocation: TourLocation?
    let tourOption: TourOption?
    
    // TODO: init uses stops and location to pull all stops and info
    init(tourStop: TourStop?, tourLocation: TourLocation?) {
        self.tourStop = tourStop
        self.tourLocation = tourLocation
        switch tourStop {
        case .allStops:
            switch tourLocation {
            case .manilaVillage: self.tourOption = .allStopsManilaVillage
            case .saintMalo: self.tourOption = .allStopsSaintMalo
            case .both: self.tourOption = .allStopsBoth
            case .none: self.tourOption = nil
            }
        case .noStops:
            switch tourLocation {
            case .manilaVillage: self.tourOption = .noStopsManilaVillage
            case .saintMalo: self.tourOption = .noStopsSaintMalo
            case .both: self.tourOption = .noStopsBoth
            case .none: self.tourOption = nil
            }
        case .none: self.tourOption = nil
        }
    }
}
