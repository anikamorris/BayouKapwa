//
//  IntroHoursView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import SwiftUI

struct IntroHoursView: View {

    let location: NavigationLocation

    var body: some View {
        if location == .chtfbIntro {
            CHTWBooksHoursView()
                .padding(.bottom)
        }
        if location == .losIslenosIntro {
            LosIslenosHoursView()
        }
    }
}
