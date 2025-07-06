//
//  StMaloCompletionView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct StMaloCompletionView: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("You have finished the Saint Malo tour")
            Text("Thank you for participating")
            Button("Return to Home") {
                path = NavigationPath()
            }
        }
    }

}
