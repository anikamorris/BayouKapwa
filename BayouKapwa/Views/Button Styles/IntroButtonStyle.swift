//
//  IntroButtonStyle.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/8/25.
//

import SwiftUI

struct IntroButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.headline)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.45, green: 0.59, blue: 0.31))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}
