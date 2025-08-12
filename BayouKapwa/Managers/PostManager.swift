//
//  PostManager.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/12/25.
//

import Foundation
import FirebaseFirestore

struct DBPost: Codable {
    let id: String
    let authorId: String
    let title: String?
    let details: String?
    let dateCreated: Date
}

final class PostManager: ObservableObject {

    static let shared = PostManager()
    private let postCollection = Firestore.firestore().collection("posts")
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private init() {}

    func createNewPost(post: DBPost) async throws {
        try postCollection.document(post.id).setData(from: post, merge: false, encoder: encoder)
    }

    func getPostByAuthor(with id: String) async throws -> [DBPost] {
        let snapshot = try await postCollection.whereField("author_id", isEqualTo: id).getDocuments()
        return try snapshot.documents.map { document in
            try document.data(as: DBPost.self, decoder: decoder)
        }
    }

    func getAllPosts() async throws -> [DBPost] {
        let snapshot = try await postCollection.getDocuments()
        return try snapshot.documents.map { document in
            try document.data(as: DBPost.self, decoder: decoder)
        }
    }
}
