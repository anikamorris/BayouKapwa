//
//  NumPeopleView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/8/25.
//

import SwiftUI

struct NumPeopleView: View {

    @Binding var path: NavigationPath
    @State private var numPeople: Int = 1
    @State var tour: Tour

    var body: some View {
        VStack {
            Text("Roles")
                .font(.largeTitle)
                .padding()

            Text("On the next page, you will choose your role for today's journey. Let us know how many people are in your group so we can give you the appropriate number of options to choose from. If your group is taking multiple vehicles, just include the number of people in your vehicle.")

            Picker("Select a number", selection: $numPeople) {
                ForEach(1..<7) { number in 
                    Text("\(number)")
                }
            }
            .pickerStyle(.wheel)
            .padding(.vertical)

            Spacer()

            Button("Next") {
                tour.setNumPeople(to: numPeople)
                path.append(
                    NavigationValue(
                        navLocation: .rolesView,
                        tour: tour
                    )
                )
            }
        }
        .padding()
    }

}
