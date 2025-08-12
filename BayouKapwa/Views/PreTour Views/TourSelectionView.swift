//
//  TourLocationSelectionView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct TourSelectionView: View {

    @State private var tourStop: TourStopOption = .allStops
    @State private var tourLocation: TourLocation = .manilaVillage
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Choose your tour")
                .font(.largeTitle)

            Picker("Tour location options", selection: $tourLocation) {
                ForEach(TourLocation.allCases) { location in
                    Text(location.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.vertical)

            switch tourLocation {
            case .manilaVillage:
                Text("Manila Village Info")
            case .stMalo:
                Text("St. Malo Info")
            }

            Picker("All stops", selection: $tourStop) {
                ForEach(TourStopOption.allCases) { value in
                    Text(value.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.vertical)

            switch tourStop {
            case .allStops:
                Text("All stops info")
            case .noStops:
                Text("No stops info")
            }

            Spacer()

            Button("Next") {
                path.append(
                    NavigationValue(
                        navLocation: .numPeopleView,
                        tour: Tour(tourStop: tourStop, tourLocation: tourLocation)
                    )
                )
            }
            .buttonStyle(IntroButton())
        }
        .padding()
    }

}
