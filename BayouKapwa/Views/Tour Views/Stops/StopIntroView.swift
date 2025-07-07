//
//  StopIntroView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import SwiftUI

struct StopIntroView: View {

    @Binding var path: NavigationPath
    let location: NavigationLocation
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
                Text("Placeholder description")
            }
            Spacer()
            if location == .fhfsIntro || location == .chtfbIntro {
                Button("Skip this stop") {
                    path.append(NavigationValue(navLocation: nextStop(), tour: nil))
                }
                .buttonStyle(.bordered)
                .padding()
            }
            Button("I'm on my way") {
                path.append(NavigationValue(navLocation: nextLocation(), tour: nil))
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .padding()
    }

    private func nextLocation() -> NavigationLocation {
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

    private func nextStop() -> NavigationLocation {
        switch location {
        case .fhfsIntro: return .chtfbIntro
        case .chtfbIntro: return .losIslenosIntro
        default: return .emptyView
        }
    }

}
