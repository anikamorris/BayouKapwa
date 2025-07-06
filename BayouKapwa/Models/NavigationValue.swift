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
    case losIslenosCeremony
    case losIslenosStop

    case stMaloMarkerIntro
    case stMaloMarkerStop

    case shellBeachIntro
    case shellBeachCeremony
    case shellBeachStop

    case stMaloCompletionView
}

struct NavigationValue: Hashable {
    let navLocation: NavigationLocation
    let tour: Tour?
}
