//
//  NavigationValue.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import Foundation

enum NavigationLocation: Hashable {
    case introView
    case tourSelectionView
    case itineraryContainer
    case emptyView

    // MARK: St Malo Stops
    case fhfsIntro
    case fhfsCeremony
    case fhfsStop

    case chtfbIntro
    case chtfbCeremony
    case chtfbStop

    // MARK: St Malo Tour
    case losIslenosIntro
}

struct NavigationValue: Hashable {
    let navLocation: NavigationLocation
    let tour: Tour?
}
