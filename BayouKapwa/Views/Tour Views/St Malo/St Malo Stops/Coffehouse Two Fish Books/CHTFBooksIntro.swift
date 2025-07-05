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
            Text("Coffeehouse and Two Fish Books")
            Text("7265 St Claude Ave, Arabi, LA 70032")
            CHTWBooksHoursView()
            Text("Placeholder descriptions")
            NavigationLink("Skip this stop") {
                LosIslenosIntro()
            }
            NavigationLink("Will make this stop") {
                CHTFBooksCeremony()
            }
        }
        .padding()
    }

}

#Preview {
    CHTFBooksIntro()
}
