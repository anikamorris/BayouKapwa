//
//  RolesView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/22/25.
//

import SwiftUI

struct RolesView: View {

    @State private var role: Role = .navigator
    @Binding var path: NavigationPath
    @State var tour: Tour

    var body: some View {
        VStack {
            Text("Choose your role")
                .font(.largeTitle)
                .padding()

            Text("These roles are to help you get the most out of your journey today. We've found they aid in ensuring each of you takes ownership of your experience.")

            Picker("Roles", selection: $role) {
                switch tour.numPeople {
                case 1:
                    Text("You are all the roles")
                case 2:
                    ForEach([Role.navigator, Role.ceremonialist]) { value in
                        Text(value.rawValue)
                    }
                default:
                    ForEach(Role.allCases) { value in
                        Text(value.rawValue)
                    }
                }
            }
            .pickerStyle(.segmented)
            .padding(.vertical)

            switch role {
            case .navigator:
                Text("The navigator will be in charge of managing directions, so we recommend that whoever is driving assume this role.")
            case .ceremonialist:
                Text("The ceremonialist will be leading your ceremonies on the way to each destination. This can include reading passages, playing audio clips, or leading reflections. For this reason, we recommend this person does not manage driving or directions. If you assume ceremonialist duties, feel free to pass your device to documentarians to share this role.")
            case .documentarian:
                Text("Documentarians will be in charge of documenting your experiences today. Whether that's through taking photos and videos, journaling, taking notes, or making art, documentarians will ensure today's journey won't soon be forgotten.")
            }

            Spacer()

//            Text("\(role.rawValue)")
//                .font(.title2)

            Button("\(role.rawValue)") {
                tour.setRole(to: role)
                path.append(
                    NavigationValue(
                        navLocation: .itineraryContainer,
                        tour: tour
                    )
                )
            }
            .buttonStyle(IntroButton())
        }
        .padding()
    }

}
