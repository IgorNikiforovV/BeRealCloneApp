//
//  MemoryView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 17.10.2024.
//

import SwiftUI

struct MemoryView: View {

    var day: Int

    var body: some View {
        VStack {
            ZStack {
                Text("\(day)")
                    .foregroundStyle(.white)
                    .zIndex(1)
                Image("back")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 8, height: 70)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.white, lineWidth: 1.5)
                            .frame(width: UIScreen.main.bounds.width / 8, height: 70)
                    )
            }
        }
    }
}

#Preview {
    MemoryView(day: 12)
}
