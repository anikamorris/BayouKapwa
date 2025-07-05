//
//  CHTWBooksHoursView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTWBooksHoursView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Coffeehouse Hours")
                HStack {
                    Text("Sat")
                    Spacer()
                    Text("Closed")
                }
                HStack {
                    Text("Sun")
                    Spacer()
                    Text("7am - 6pm")
                }
                HStack {
                    Text("Mon")
                    Spacer()
                    Text("6am - 6pm")
                }
                HStack {
                    Text("Tues")
                    Spacer()
                    Text("6am - 6pm")
                }
                HStack {
                    Text("Weds")
                    Spacer()
                    Text("6am - 6pm")
                }
                HStack {
                    Text("Thurs")
                    Spacer()
                    Text("6am - 6pm")
                }
                HStack {
                    Text("Fri")
                    Spacer()
                    Text("6am - 6pm")
                }
            }
            Spacer()
            VStack {
                Text("Two Fish Books Hours")
                HStack {
                    Text("Sat")
                    Spacer()
                    Text("Closed")
                }
                HStack {
                    Text("Sun")
                    Spacer()
                    Text("10am - 6pm")
                }
                HStack {
                    Text("Mon")
                    Spacer()
                    Text("10am - 12am")
                }
                HStack {
                    Text("Tues")
                    Spacer()
                    Text("10am - 6pm")
                }
                HStack {
                    Text("Weds")
                    Spacer()
                    Text("10am - 6pm")
                }
                HStack {
                    Text("Thurs")
                    Spacer()
                    Text("10am - 6pm")
                }
                HStack {
                    Text("Fri")
                    Spacer()
                    Text("10am - 6pm")
                }
            }
        }
    }
}

#Preview {
    CHTWBooksHoursView()
}
