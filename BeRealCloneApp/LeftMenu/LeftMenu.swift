//
//  LeftMenu.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 01.11.2024.
//

import SwiftUI

struct LeftMenu: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                LeftMenuTopView()
            }
        }
    }
}

#Preview {
    LeftMenu()
}
