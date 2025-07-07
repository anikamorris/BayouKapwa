//
//  ManilaVillageCompletionView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct ManilaVillageCompletionView: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("You have finished the Manila Village tour")
            Text("Thank you for participating")
            Button("Return to Home") {
                path = NavigationPath()
            }
        }
    }
}
