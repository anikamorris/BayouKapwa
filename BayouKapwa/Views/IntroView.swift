//
//  IntroView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack {
            Text("What to Expect")
                .font(.largeTitle)
                .padding()
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
            
            Spacer()
            
            NavigationLink {
                TourSelectionView()
            } label: {
                Text("Next")
            }
        }
        .padding()
    }
}

#Preview {
    IntroView()
}
