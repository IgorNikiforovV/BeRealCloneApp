//
//  FeedViewModel.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 29.12.2024.
//

import SwiftUI
import Firebase

final class FeedViewModel: ObservedObject {
    func fetchData(date: String) async {
        let db = Firestore.firestore()

        do {
            let data = try await db.collection("posts").document(date).collection("bereals").getDocuments()
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
