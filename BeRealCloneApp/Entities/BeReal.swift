//
//  BeReal.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 29.12.2024.
//

import SwiftUI

struct BeReal: Decodable {
    var username: String
    var frontImageUrl: String
    var backImageUrl: String
    var userId: String
    var user: User?
}
