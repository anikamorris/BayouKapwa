//
//  CHTFBooksStop.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTFBooksStop: View {
    
    @Binding var path: NavigationPath
    let stop: TourStop

    var body: some View {
        VStack {
            Text("\(stop.name)")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            VStack(alignment: .leading) {
                Text("Find the book *A Concise History of St. Bernard Parish* by C. Avery Manning.")
                    .padding(.bottom)
                Text("We recommend you purchase the book. If you’re unable to purchase it, take photos of pages 34, 35, 36.")
                    .padding(.bottom)
                Text("Maybe have a chat with Ms. Gail, the bookshop keeper.")
                    .padding(.bottom)
            }
            Spacer()
            Button("Next stop") {
                path.append(TourNavigationValue(navLocation: .losIslenosIntro, tour: nil))
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

}
