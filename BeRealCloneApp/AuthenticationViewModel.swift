//
//  AuthenticationViewModel.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 04.12.2024.
//

import SwiftUI
import Combine
import FirebaseAuth
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore

final class AuthenticationViewModel: ObservableObject {
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country = Country(isoCode: "RU")
    @Published var phoneNumber = ""
    @Published var otpText = ""

    @Published var navigationTag: String?

    @Published var isLoading = false
    @Published var verificationCode = ""

    @Published var errorMessage = ""
    @Published var showAlert = false

    @Published var userSession: FirebaseAuth.User? {
        didSet {
            print("userSession заполнен \(userSession != nil)")
        }
    }
    @Published var currentUser: User?

    static let shared = AuthenticationViewModel()

    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }

    func sendOtp() async {
        if isLoading { return }

        do {
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(country.phoneCode)\(phoneNumber))", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VARIFICATION"
            }
        } catch {
            print("ERROR: \(error.localizedDescription)")
            handleError(error.localizedDescription)
        }
    }

    func handleError(_ error: String) {
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = error
            self.showAlert.toggle()
        }
    }

    func verifyOtp() async {
        do {
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)

            let result = try await Auth.auth().signIn(with: credential)

            let db = Firestore.firestore()
            db.collection("users").document(result.user.uid).setData([
                "fullname": name,
                "date": year.date,
                "id": result.user.uid
            ]) { err in
                if let err {
                    print(err.localizedDescription)
                }
            }

            DispatchQueue.main.async {
                self.isLoading = false
                let user = result.user
                self.userSession = user
                print("🚩 user.uid: \(user.uid)")
            }
        } catch {
            print("ERROR: \(error.localizedDescription)")
            handleError(error.localizedDescription)
        }
    }

    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }

    func fetchUser() {
        guard  let uid = userSession?.uid else {  return }

        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }

            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser
        }
    }
}


