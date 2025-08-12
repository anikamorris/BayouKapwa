//
//  NavigationValue.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import Foundation

enum TourNavigationLocation: Hashable {

    // MARK: Pre-tour
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

struct TourNavigationValue: Hashable {
    let navLocation: TourNavigationLocation
    let tour: Tour?
}

enum ProfileNavigationLocation: Hashable {
    case profile
    case settings
    case newPost
}

struct ProfileNavigationValue: Hashable {
    let navLocation: ProfileNavigationLocation
}
