//
//  LosIslenosHoursView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/6/25.
//

import SwiftUI

struct LosIslenosHoursView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Weds - Sun")
                Spacer()
                Text("11am - 4pm")
            }
            HStack {
                Text("Mon - Tues")
                Spacer()
                Text("Closed")
            }
        }
        .padding(.horizontal, 48)
        .padding(.bottom)
    }
}

#Preview {
    LosIslenosHoursView()
}
