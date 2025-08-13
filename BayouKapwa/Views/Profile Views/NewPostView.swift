//
//  NewPostView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/12/25.
//

import SwiftUI

struct NewPostView: View {

    @StateObject private var viewModel = PostViewModel()
    @State private var showError: Bool = false
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            TextField("Title", text: $viewModel.title)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.45, green: 0.59, blue: 0.31), lineWidth: 2)
                }
            TextEditor(text: $viewModel.details)
                .frame(minHeight: 100, maxHeight: .infinity)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.45, green: 0.59, blue: 0.31), lineWidth: 2)
                }
            Button("Post") {
                Task {
                    do {
                        try await viewModel.createPost()
                        path = NavigationPath()
                    } catch {
                         showError = true
                    }
                }
            }
            .buttonStyle(IntroButton())
            .padding(.vertical)
        }
        .padding()
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Something went wrong"),
                message: Text("Please try again"),
                dismissButton: .cancel(Text("OK"))
            )
        }
    }

}
