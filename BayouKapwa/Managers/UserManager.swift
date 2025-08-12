//
//  UserManager.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/5/25.
//

import Foundation
import FirebaseFirestore

struct DBUser: Codable {
    let id: String
    let name: String
    let email: String?
    let dateCreated: Date?
}

final class UserManager: ObservableObject {

    static let shared = UserManager()
    private let userCollection = Firestore.firestore().collection("users")
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

    private init() { }

    func createNewUser(auth: LocalAuthDataResult, name: String) async throws {
        let dbUser = DBUser(id: auth.id, name: name, email: auth.email, dateCreated: Date())
        try userCollection.document(auth.id).setData(from: dbUser, encoder: encoder)
    }

    func getUser(from userId: String) async throws -> DBUser {
        try await userCollection.document(userId).getDocument(as: DBUser.self, decoder: decoder)
    }
}
