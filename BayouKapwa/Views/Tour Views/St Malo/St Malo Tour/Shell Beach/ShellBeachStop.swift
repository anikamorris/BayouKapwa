//
//  ShellBeachStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct ShellBeachStop: View {
    
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Shell Beach")
            Text("Placeholder description")
            Button("Finish Tour") {
                path.append(TourNavigationValue(navLocation: .stMaloCompletionView, tour: nil))
            }
        }
    }

}
