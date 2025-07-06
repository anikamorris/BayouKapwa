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
                Text("\(address)")
                    .padding(.top, 2)
                    .padding(.bottom)
            }
            IntroHoursView(location: location)
            if let shortDescription = stop.shortDescription {
                Text("\(shortDescription)")
            } else {
                Text("Placeholder description")
            }
            Spacer()
            if location == .fhfsIntro || location == .chtfbIntro {
                Button("Skip this stop") {
                    path.append(NavigationValue(navLocation: nextStop(), tour: nil))
                }
            }
            Button("I'm on my way") {
                path.append(NavigationValue(navLocation: nextCeremony(), tour: nil))
            }
        }
        .padding()
    }

    private func nextCeremony() -> NavigationLocation {
        switch location {
        case .fhfsIntro: return .fhfsCeremony
        case .chtfbIntro: return .chtfbCeremony
        case .losIslenosIntro: return .losIslenosCeremony
        case .stMaloMarkerIntro: return .stMaloMarkerStop
        case .shellBeachIntro: return .shellBeachCeremony
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
