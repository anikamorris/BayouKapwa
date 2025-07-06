//
//  CHTFBooksIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTFBooksIntro: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Coffeehouse and \nTwo Fish Books")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top)
            Text("7265 St Claude Ave, Arabi, LA 70032")
                .padding(.top, 2)
                .padding(.bottom)
            CHTWBooksHoursView()
                .padding(.bottom)
            Text("Placeholder descriptions")
            Spacer()
            Button("Skip this stop") {
                path.append(NavigationValue(navLocation: .losIslenosIntro, tour: nil))
            }
            Button("Will make this stop") {
                path.append(NavigationValue(navLocation: .chtfbCeremony, tour: nil))
            }
        }
        .padding()
    }

}
