//
//  ContentView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct WelcomeView: View {

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                Text("Bayou Kapwa")
                    .font(.largeTitle)
                    .padding()
                Text("Welcome to your self-guided tour")
                    .padding()
                Spacer()
                Button("Let's go") {
                    path.append(NavigationValue(navLocation: .introView, tour: nil))
                }
            }
            .padding()
            .navigationDestination(for: NavigationValue.self) { navValue in
                switch navValue.navLocation {
                case .introView: IntroView(path: $path)
                case .tourSelectionView: TourSelectionView(path: $path)
                case .itineraryContainer: ItineraryContainer(path: $path, tour: navValue.tour!)
                case .emptyView: EmptyView()
                case .fhfsIntro, .chtfbIntro, .losIslenosIntro, .stMaloMarkerIntro, .shellBeachIntro, .manilaVillageMarkerIntro, .multipurposeCenterIntro, .townHallIntro, .natureTraceIntro:
                    StopIntroView(
                        path: $path,
                        location: navValue.navLocation,
                        stop: TourStop(from: navValue.navLocation)
                    )
                case .fhfsCeremony: FHFStoreCeremony(path: $path)
                case .fhfsStop: FHFStoreStop(path: $path)
                case .chtfbCeremony: CHTFBooksCeremony(path: $path)
                case .chtfbStop: CHTFBooksStop(path: $path)
                case .losIslenosCeremony: LosIslenosCeremony(path: $path)
                case .losIslenosStop: LosIslenosStop(path: $path)
                case .stMaloMarkerStop: StMaloMarkerStop(path: $path)
                case .shellBeachCeremony: ShellBeachCeremony(path: $path)
                case .shellBeachStop: ShellBeachStop(path: $path)
                case .stMaloCompletionView: StMaloCompletionView(path: $path)
                case .manilaVillageMarkerCeremony: ManilaVillageMarkerCeremony(path: $path)
                case .manilaVillageMarkerStop: ManilaVillageMarkerStop(path: $path)
                case .multipurposeCenterCeremony: MultipurposeCenterCeremony(path: $path)
                case .multipurposeCenterStop: MultipurposeCenterStop(path: $path)
                case .townHallCeremony: TownHallCeremony(path: $path)
                case .townHallStop: TownHallStop(path: $path)
                case .natureTraceCeremony: NatureTraceCeremony(path: $path)
                case .natureTraceStop: NatureTraceStop(path: $path)
                case .manilaVillageCompletionView: ManilaVillageCompletionView(path: $path)
                }
            }
        }
    }

}
