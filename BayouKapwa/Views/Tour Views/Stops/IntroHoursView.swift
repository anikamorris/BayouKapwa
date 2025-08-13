//
//  IntroHoursView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import SwiftUI

struct IntroHoursView: View {

    let location: TourNavigationLocation

    var body: some View {
        if location == .chtfbIntro {
            CHTFBooksHoursView()
                .padding(.bottom)
        }
        if location == .losIslenosIntro {
            LosIslenosHoursView()
        }
    }
}
