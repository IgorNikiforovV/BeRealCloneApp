//
//  User.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 11.12.2024.
//

import Firebase
import FirebaseFirestore

struct User: Decodable, Identifiable {
    @DocumentID var id: String?
    var username: String?
    var profileImageUrl: String?
    var fullname: String
    var date: String
    var bio: String?
    var location: String?
}
