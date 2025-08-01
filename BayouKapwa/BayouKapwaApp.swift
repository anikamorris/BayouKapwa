//
//  BayouKapwaApp.swift
//  BayouKapwa
//
//  Created by Anika Morris on 7/4/25.
//

import SwiftUI
import Firebase

@main
struct BayouKapwaApp: App {

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
