//
//  MainAuthenticationView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 04.12.2024.
//

import SwiftUI

struct MainAuthenticationView: View {
    @State private var nameButtonClicked = false
    @State private var ageButtonClicked = false
    @State private var phoneNumberButtonClicked = false

    var body: some View {
        NavigationView {
            if !nameButtonClicked {
                EnterNameView(nameButtonClicked: $nameButtonClicked)
            }
            else if nameButtonClicked && !ageButtonClicked {
                EnterAgeView(ageButtonClicked: $ageButtonClicked)
            }
            else if nameButtonClicked && ageButtonClicked && !phoneNumberButtonClicked {
                EnterPhoneNumberView(phoneNumberButtonClicked: $phoneNumberButtonClicked)
            }
        }
    }
}

#Preview {
    MainAuthenticationView()
}
