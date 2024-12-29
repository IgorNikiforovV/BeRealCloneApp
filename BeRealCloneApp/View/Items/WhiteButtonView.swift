//
//  WhiteButtonView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 23.11.2024.
//

import SwiftUI

struct WhiteButtonView: View {
    @Binding var buttonActive: Bool
    var title: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 44)
                .foregroundColor(buttonActive ? Color(red: 250/255, green: 250/255, blue: 250/255) : Color(red: 86/255, green: 86/255, blue: 88/255))
            HStack {
                Spacer()
                Text(title)
                    .foregroundStyle(.black)
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                Spacer()
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
            .frame(height: 30)
        }
    }
}

#Preview {
    WhiteButtonView(buttonActive: .constant(false), title: "Save")
}
