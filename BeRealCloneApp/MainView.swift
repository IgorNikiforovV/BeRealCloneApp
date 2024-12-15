//
//  MainView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 11.12.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                MainAuthenticationView()
            } else {
                if let user = viewModel.currentUser {
                    ContentView()
                } else {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
