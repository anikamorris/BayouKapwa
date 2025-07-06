//
//  FHFStoreIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct FHFStoreIntro: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Fred Hampton Free Store")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top)
            Text("5523 St Claude Ave, New Orleans, LA 70117")
                .padding(.top, 2)
                .padding(.bottom)
            Text("Placeholder description")
            Spacer()
            Button("Skip this stop") {
                path.append(NavigationValue(navLocation: .chtfbIntro, tour: nil))
            }
            Button("Will make this stop") {
                path.append(NavigationValue(navLocation: .fhfsCeremony, tour: nil))
            }
        }
        .padding()
    }
}
