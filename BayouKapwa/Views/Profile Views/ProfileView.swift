//
//  ProfileView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/1/25.
//

import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var postViewModel = PostViewModel()
    @Binding var path: NavigationPath

    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.user {
                Text(user.name)
                    .font(.largeTitle)
                    .padding()
            }
            if let posts = postViewModel.posts {
                PostsListView(posts: posts)
            } else {
                Text("You don't have any posts yet.")
            }
        }
        .padding()
        .task {
            try? await viewModel.fetchUserData()
            try? await postViewModel.getPostsByUser()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationLink(value: ProfileNavigationValue(navLocation: .newPost)) {
                    Image(systemName: "plus.circle")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: ProfileNavigationValue(navLocation: .settings)) {
                    Image(systemName: "gear")
                }
            }
        }
    }

}
