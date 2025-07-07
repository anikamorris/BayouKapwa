//
//  AddressView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/7/25.
//

import SwiftUI

struct AddressView: View {

    @ObservedObject var locationManager = LocationManager()
    @State private var showMapSelection: Bool = false
    let address: String

    var body: some View {
        VStack {
            Text("\(address)")
                .padding(.top, 2)
                .padding(.bottom)
            Button {
                showMapSelection = true
            } label: {
                Text("Directions")
                    .padding(.top, 2)
                    .padding(.bottom)
            }
            .confirmationDialog("Open Directions", isPresented: $showMapSelection, titleVisibility: .hidden) {
                Button("Open in Maps") {
                    locationManager.openMapWithAddress(address, in: .appleMaps)
                }
                Button("Open in Google Maps") {
                    locationManager.openMapWithAddress(address, in: .googleMaps)
                }
                Button("Copy") {
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = address
                }
                Button("Cancel", role: .cancel) { }
            }
            .alert(isPresented: $locationManager.invalid) {
                Alert(
                    title: Text("Error"),
                    message: Text("Could not open address"),
                    dismissButton: .default(Text("OK"), action: { locationManager.invalid = false })
                )
            }
        }
    }
}
