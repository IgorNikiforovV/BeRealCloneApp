//
//  FeedCellViewModel.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 02.01.2025.
//

import SwiftUI
import Firebase

final class FeedCellViewModel: ObservableObject {
    @Published var bereal: BeReal

    init(bereal: BeReal) {
        self.bereal = bereal
        fetchBeRealUser()
    }

    func fetchBeRealUser() {
        Firestore.firestore().collection("users").document(bereal.userId).getDocument { snap, err in
            if let err {
                print(err.localizedDescription)
                return
            }

            self.bereal.user = try? snap?.data(as: User.self)
        }
    }
}
