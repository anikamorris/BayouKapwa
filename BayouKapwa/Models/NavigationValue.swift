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
    case numPeopleView
    case rolesView
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

    // MARK: Manila Village Tour
    case manilaVillageMarkerIntro
    case manilaVillageMarkerCeremony
    case manilaVillageMarkerStop

    case multipurposeCenterIntro
    case multipurposeCenterCeremony
    case multipurposeCenterStop

    case townHallIntro
    case townHallCeremony
    case townHallStop

    case natureTraceIntro
    case natureTraceCeremony
    case natureTraceStop

    case manilaVillageCompletionView
}

struct NavigationValue: Hashable {
    let navLocation: NavigationLocation
    let tour: Tour?
}
