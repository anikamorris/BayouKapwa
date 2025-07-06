//
//  StopIntroView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import SwiftUI

struct StopIntroView: View {

    @ObservedObject var locationManager = LocationManager()
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
                Button {
                    locationManager.openMapWithAddress(address)
                } label: {
                    Text("Directions")
                        .padding(.top, 2)
                        .padding(.bottom)
                }
                .alert(isPresented: $locationManager.invalid) {
                    Alert(title: Text("Error"), message: Text("Could not open address"), dismissButton: .default(Text("OK"), action:{
                        locationManager.invalid = false
                    }))
                }
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
                .buttonStyle(.bordered)
                .padding()
            }
            Button("I'm on my way") {
                path.append(NavigationValue(navLocation: nextCeremony(), tour: nil))
            }
            .buttonStyle(.bordered)
            .padding()
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
