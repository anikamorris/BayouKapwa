//
//  CHTWBooksHoursView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTFBooksHoursView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Sat")
                Text("Sun")
                Text("Mon")
                Text("Tues")
                Text("Weds")
                Text("Thurs")
                Text("Fri")
            }
            .padding(.top, 22)
            VStack {
                Text("The Coffeehouse")
                Text("Closed")
                Text("7am - 6pm")
                Text("6am - 6pm")
                Text("6am - 6pm")
                Text("6am - 6pm")
                Text("6am - 6pm")
                Text("6am - 6pm")
            }
            .padding(.horizontal, 16)
            VStack {
                Text("Two Fish Books")
                Text("Closed")
                Text("10am - 6pm")
                Text("10am - 12am")
                Text("10am - 6pm")
                Text("10am - 6pm")
                Text("10am - 6pm")
                Text("10am - 6pm")
            }
            .padding(.horizontal, 12)
        }
    }
}

#Preview {
    CHTFBooksHoursView()
}
