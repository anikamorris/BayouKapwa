//
//  CHTFBooksCeremony.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/5/25.
//

import SwiftUI

struct CHTFBooksCeremony: View {
    var body: some View {
        VStack {
            Text("First Ceremony")
            NavigationLink("Finished") {
                CHTFBooksStop()
            }
        }
    }
}

#Preview {
    CHTFBooksCeremony()
}
