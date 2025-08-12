//
//  RootView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct RootView: View {

    @State private var path = NavigationPath()
    @State private var showAuthView = false

    var body: some View {
        ZStack {
            TabView {
                NavigationStack(path: $path) {
                    WelcomeView(path: $path)
                        .navigationDestination(for: NavigationValue.self) { navValue in
                            navDestination(from: navValue)
                        }
                }
                .tabItem {
                    Label("Tours", systemImage: "map")
                }
                ProfileView(showAuthView: $showAuthView)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .tint(Color(red: 0.4, green: 0.54, blue: 0.26))
            .onAppear {
                let user = try? AuthenticationManager.shared.getAuthenticatedUser()
                self.showAuthView = user == nil
            }
            .fullScreenCover(isPresented: $showAuthView) {
                NavigationStack {
                    AuthView(showAuthView: $showAuthView)
                }
            }
        }
    }

    // Listen, I know this is a mess, but we need to be able to pop back to the welcome view from the deepest tour view, which means we need to pass the navigation path to each view. If you have a better idea, I'm more than happy to hear it and would gladly refactor. Thank you and I'm sorry.
    @ViewBuilder private func navDestination(from navValue: NavigationValue) -> some View {
        switch navValue.navLocation {
        case .introView: IntroView(path: $path)
        case .tourSelectionView: TourSelectionView(path: $path)
        case .numPeopleView: NumPeopleView(path: $path, tour: navValue.tour!)
        case .rolesView: RolesView(path: $path, tour: navValue.tour!)
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
        case .chtfbStop: CHTFBooksStop(path: $path, stop: TourStop(from: navValue.navLocation))
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

#Preview {
    RootView()
}
