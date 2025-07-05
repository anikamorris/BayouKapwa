//
//  CHTFBooksIntro.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTFBooksIntro: View {

    @State private var showHours = false

    var body: some View {
        VStack {
            Text("Coffeehouse and \nTwo Fish Books")
                .font(.largeTitle)
                .padding(.top)
            Text("7265 St Claude Ave, Arabi, LA 70032")
                .padding(.top, 2)
                .padding(.bottom)
            CHTWBooksHoursView()
                .padding(.bottom)
            Text("Placeholder descriptions")
            Spacer()
            NavigationLink("Skip this stop") {
                LosIslenosIntro()
            }
            .padding()
            NavigationLink("Will make this stop") {
                CHTFBooksCeremony()
            }
            .padding()
        }
        .padding()
    }

}

#Preview {
    CHTFBooksIntro()
}
