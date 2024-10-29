//
//  Extensions.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 28.10.2024.
//

import SwiftUI

extension View {
    func paceholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
