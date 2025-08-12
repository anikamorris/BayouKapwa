//
//  PostViewModel.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/12/25.
//

import Foundation

enum PostError: Error {
    case emptyFields
}

@MainActor
final class PostViewModel: ObservableObject {

    @Published var posts: [DBPost]?
    @Published var title: String = ""
    @Published var details: String = ""

    func getPostsByAuthor(with id: String) async throws {
        self.posts = try await PostManager.shared.getPostByAuthor(with: id)
    }

    func createPost() async throws {
        let userId = try AuthenticationManager.shared.getAuthenticatedUser().id
        guard !title.isEmpty, !details.isEmpty else {
            throw PostError.emptyFields
        }
        let post = DBPost(
            id: UUID().uuidString,
            authorId: userId,
            title: title,
            details: details,
            dateCreated: Date()
        )
        try await PostManager.shared.createNewPost(post: post)
    }

}
