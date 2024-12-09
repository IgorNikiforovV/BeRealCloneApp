//
//  AuthenticationViewModel.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 04.12.2024.
//

import SwiftUI
import Combine
import FirebaseAuth

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

    func sendOtp() async {
        if isLoading { return }

        do {
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(country.phoneCode)\(phoneNumber))", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = true
                self.verificationCode = result
                self.navigationTag = "VARIFICATION"
            }
        } catch {
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
}


