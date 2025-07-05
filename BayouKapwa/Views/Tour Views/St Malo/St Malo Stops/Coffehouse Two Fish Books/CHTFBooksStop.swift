//
//  CHTFBooksStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTFBooksStop: View {
    var body: some View {
        VStack {
            Text("Coffeehouse and Two Fish Books")
            Text("Placeholder Description")
            NavigationLink("Next stop") {
                LosIslenosIntro()
            }
        }
    }
}

#Preview {
    CHTFBooksStop()
}
