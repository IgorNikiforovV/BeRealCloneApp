//
//  FeedViewModel.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 29.12.2024.
//

import SwiftUI
import Firebase

final class FeedViewModel: ObservableObject {
    @Published var bereals = [BeReal]()

    @Published var blur = false

    let user: User

    init(user: User) {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let dataString = formatter.string(from: date)

        self.user = user

        Task {
            await fetchData(date: dataString)
        }
    }

    func fetchData(date: String) async {
        let db = Firestore.firestore()

        do {
            let data = try await db.collection("posts").document(date).collection("bereals").getDocuments()
            self.bereals = data.documents.compactMap { try? $0.data(as: BeReal.self) }
        } catch {
            print(error.localizedDescription)
        }
    }
}
