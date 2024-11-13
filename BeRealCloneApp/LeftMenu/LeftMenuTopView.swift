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

    @Binding var mainMenu: MainMenu

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            mainMenu = .feed
                        }
                    } label: {
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.white)
                    }

                }

                Text("BeReal.")
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
    LeftMenuTopView(mainMenu: .constant(.left))
}
