//
//  LeftMenuTopView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 01.11.2024.
//

import SwiftUI

struct LeftMenuTopView: View {
    @State var text = ""
    @State var isEditing  = false

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.white)
                }

                Text("BeReal")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
            }

            SearchBar(text: $text, isEditing: $isEditing)
            Spacer()
        }
    }
}

#Preview {
    LeftMenuTopView()
}
