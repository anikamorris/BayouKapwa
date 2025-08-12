//
//  RootView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct RootView: View {

    @State private var tourPath = NavigationPath()
    @State private var profilePath = NavigationPath()
    @State private var showAuthView = false

    var body: some View {
        ZStack {
            TabView {
                NavigationStack(path: $tourPath) {
                    WelcomeView(path: $tourPath)
                        .navigationDestination(for: TourNavigationValue.self) { navValue in
                            tourNavDestination(from: navValue)
                        }
                }
                .tabItem {
                    Label("Tours", systemImage: "map")
                }
                NavigationStack(path: $profilePath) {
                    ProfileView(path: $profilePath)
                        .navigationDestination(for: ProfileNavigationValue.self) { navValue in
                            profileNavDestination(from: navValue)
                        }
                }
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

    @ViewBuilder private func profileNavDestination(from navValue: ProfileNavigationValue) -> some View {
        switch navValue.navLocation {
        case .profile: ProfileView(path: $profilePath)
        case .settings: SettingsView(showAuthView: $showAuthView, path: $profilePath)
        case .newPost: NewPostView(path: $profilePath)
        }
    }

    // Listen, I know this is a mess, but we need to be able to pop back to the welcome view from the deepest tour view, which means we need to pass the navigation path to each view. If you have a better idea, I'm more than happy to hear it and would gladly refactor. Thank you and I'm sorry.
    @ViewBuilder private func tourNavDestination(from navValue: TourNavigationValue) -> some View {
        switch navValue.navLocation {
        case .introView: IntroView(path: $tourPath)
        case .tourSelectionView: TourSelectionView(path: $tourPath)
        case .numPeopleView: NumPeopleView(path: $tourPath, tour: navValue.tour!)
        case .rolesView: RolesView(path: $tourPath, tour: navValue.tour!)
        case .itineraryContainer: ItineraryContainer(path: $tourPath, tour: navValue.tour!)
        case .emptyView: EmptyView()
        case .fhfsIntro, .chtfbIntro, .losIslenosIntro, .stMaloMarkerIntro, .shellBeachIntro, .manilaVillageMarkerIntro, .multipurposeCenterIntro, .townHallIntro, .natureTraceIntro:
            StopIntroView(
                path: $tourPath,
                location: navValue.navLocation,
                stop: TourStop(from: navValue.navLocation)
            )
        case .fhfsCeremony: FHFStoreCeremony(path: $tourPath)
        case .fhfsStop: FHFStoreStop(path: $tourPath)
        case .chtfbCeremony: CHTFBooksCeremony(path: $tourPath)
        case .chtfbStop: CHTFBooksStop(path: $tourPath, stop: TourStop(from: navValue.navLocation))
        case .losIslenosCeremony: LosIslenosCeremony(path: $tourPath)
        case .losIslenosStop: LosIslenosStop(path: $tourPath)
        case .stMaloMarkerStop: StMaloMarkerStop(path: $tourPath)
        case .shellBeachCeremony: ShellBeachCeremony(path: $tourPath)
        case .shellBeachStop: ShellBeachStop(path: $tourPath)
        case .stMaloCompletionView: StMaloCompletionView(path: $tourPath)
        case .manilaVillageMarkerCeremony: ManilaVillageMarkerCeremony(path: $tourPath)
        case .manilaVillageMarkerStop: ManilaVillageMarkerStop(path: $tourPath)
        case .multipurposeCenterCeremony: MultipurposeCenterCeremony(path: $tourPath)
        case .multipurposeCenterStop: MultipurposeCenterStop(path: $tourPath)
        case .townHallCeremony: TownHallCeremony(path: $tourPath)
        case .townHallStop: TownHallStop(path: $tourPath)
        case .natureTraceCeremony: NatureTraceCeremony(path: $tourPath)
        case .natureTraceStop: NatureTraceStop(path: $tourPath)
        case .manilaVillageCompletionView: ManilaVillageCompletionView(path: $tourPath)
        }
    }

}

#Preview {
    RootView()
}
