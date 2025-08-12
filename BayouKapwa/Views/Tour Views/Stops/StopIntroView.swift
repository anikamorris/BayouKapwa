//
//  StopIntroView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import SwiftUI

struct StopIntroView: View {

    @Binding var path: NavigationPath
    let location: TourNavigationLocation
    let stop: TourStop

    var body: some View {
        VStack {
            Text("\(stop.name)")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top)
            if let address = stop.address {
                AddressView(address: address)
            }
            IntroHoursView(location: location)
            if let shortDescription = stop.introDescription {
                Text("\(shortDescription)")
            } else {
                Text("Once you have the directions pulled up, please return here for a ceremony.") // TODO: <- Make this non optional once Carolyn sends all copy
            }
            Spacer()
            if location == .fhfsIntro || location == .chtfbIntro {
                Button("Skip this stop") {
                    path.append(TourNavigationValue(navLocation: nextStop(), tour: nil))
                }
                .buttonStyle(.bordered)
                .padding()
            }
            Button("I'm on my way") {
                path.append(TourNavigationValue(navLocation: nextLocation(), tour: nil))
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .padding()
    }

    private func nextLocation() -> TourNavigationLocation {
        switch location {
        case .fhfsIntro: return .fhfsCeremony
        case .chtfbIntro: return .chtfbCeremony
        case .losIslenosIntro: return .losIslenosCeremony
        case .stMaloMarkerIntro: return .stMaloMarkerStop
        case .shellBeachIntro: return .shellBeachCeremony
        case .manilaVillageMarkerIntro: return .manilaVillageMarkerCeremony
        case .multipurposeCenterIntro: return .multipurposeCenterCeremony
        case .townHallIntro: return .townHallCeremony
        case .natureTraceIntro: return .natureTraceCeremony
        default: return .emptyView
        }
    }

    private func nextStop() -> TourNavigationLocation {
        switch location {
        case .fhfsIntro: return .chtfbIntro
        case .chtfbIntro: return .losIslenosIntro
        default: return .emptyView
        }
    }

}
