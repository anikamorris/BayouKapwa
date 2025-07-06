//
//  CHTFBooksStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTFBooksStop: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Coffeehouse and Two Fish Books")
            Text("Placeholder Description")
            Button("Next stop") {
                path.append(NavigationValue(navLocation: .losIslenosIntro, tour: nil))
            }
        }
    }

}
