//
//  ContentView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 08.10.2024.
//

import SwiftUI

enum MainMenu: CGFloat {
    case left = 1
    case feed = 0
    case profile = -1
}
struct ContentView: View {
    @State var width = UIScreen.main.bounds.width
    @State var menu: MainMenu = .feed

    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                LeftMenu(mainMenu: $menu)
                    .frame(width: width)
                FeedView(mainMenu: $menu)
                    .frame(width: width)
                Profile(mainMenu: $menu)
                    .frame(width: width)
            }
//            .offset(x: menu == "left" ? width : 0)
//            .offset(x: menu == "profile" ? -(width) : 0)
            .offset(x: width * menu.rawValue)
        }
    }
}

#Preview {
    ContentView()
}
