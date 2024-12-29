//
//  CameraViewModel.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 27.12.2024.
//

import SwiftUI
import Firebase
import FirebaseFirestore

final class CameraViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }

    func takePhoto(backImage: UIImage, frontImage: UIImage, completion: @escaping(String, String) -> Void) {
        ImageUploader.uploadImage(image: backImage, type: .post) { urlBackImage in
            ImageUploader.uploadImage(image: frontImage, type: .post) { urlFrontImage in
                completion(urlBackImage, urlFrontImage)
            }
        }
    }

    func postBereal(backImageUrl: String, frontImageUrl: String) async {
        let db = Firestore.firestore()

        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let dateString = formatter.string(from: date)
        print(dateString)

        do {
            try await db.collection("posts").document("\(dateString)").collection("bereals").document(user.id!)
                .setData([
                    "frontImageUrl" : frontImageUrl,
                    "backImageUrl": backImageUrl,
                    "userId": user.id,
                    "username": user.fullname
                ])
        } catch {
            print(error.localizedDescription)
        }
    }
}
