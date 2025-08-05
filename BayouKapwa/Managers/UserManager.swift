//
//  UserManager.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/5/25.
//

import Foundation
import FirebaseFirestore

struct DBUser {
    let id: String
    let name: String
    let email: String
    let photoUrl: String?
    let dateCreated: Date
}

final class UserManager: ObservableObject {

    static let shared = UserManager()
    private init() { }

    func createNewUser(auth: LocalAuthDataResult, name: String) async throws {
        var userData: [String : Any] = [
            "user_id" : auth.id,
            "name" : name,
            "email" : auth.email,
            "date_created" : Timestamp()
        ]
        if let photoUrl = auth.photoUrl {
            userData["photo_url"] = photoUrl
        }
        try await Firestore.firestore().collection("users").document(auth.id).setData(userData)
    }

    func getUser(from userId: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        guard
            let data = snapshot.data(),
            let userId = data["user_id"] as? String,
            let name = data["name"] as? String,
            let email = data["email"] as? String,
            let dateCreated = data["date_created"] as? Date
        else {
            throw URLError(.badServerResponse)
        }
        let photoUrl = data["photo_url"] as? String
        return DBUser(
            id: userId,
            name: name,
            email: email,
            photoUrl: photoUrl,
            dateCreated: dateCreated
        )
    }
}
