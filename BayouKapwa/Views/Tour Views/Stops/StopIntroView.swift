//
//  StopIntroView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import SwiftUI

struct StopIntroView: View {

    @ObservedObject var locationManager = LocationManager()
    @State private var showMapSelection: Bool = false
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
                Button {
                    showMapSelection = true
                } label: {
                    Text("Directions")
                        .padding(.top, 2)
                        .padding(.bottom)
                }
                .confirmationDialog("Open Directions", isPresented: $showMapSelection, titleVisibility: .hidden) {
                    Button("Open in Maps") {
                        locationManager.openMapWithAddress(address, in: .appleMaps)
                    }
                    Button("Open in Google Maps") {
                        locationManager.openMapWithAddress(address, in: .googleMaps)
                    }
                    Button("Copy") {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = address
                    }
                    Button("Cancel", role: .cancel) { }
                }
                .alert(isPresented: $locationManager.invalid) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Could not open address"),
                        dismissButton: .default(Text("OK"), action: { locationManager.invalid = false })
                    )
                }
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
