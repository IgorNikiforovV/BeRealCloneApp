//
//  LeftMenu.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 01.11.2024.
//

import SwiftUI

extension LeftMenu {
    enum Menu: String {
        case suggestions = "Suggestions"
        case friends = "Friends"
        case requests = "Requests"
    }
}

struct LeftMenu: View {
    @State var width = UIScreen.main.bounds.width
    @State var menu: Menu = .suggestions

    @Binding var mainMenu: MainMenu

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                LeftMenuTopView(mainMenu: $mainMenu)

                switch menu {
                case .suggestions: Suggestions()
                case .friends: FriendsView()
                case .requests: RequestView()
                }

                VStack {
                    Spacer()

                    ZStack {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 22)
                                    .frame(width: width * 0.7, height: 40)
                                    .foregroundColor(Color(red: 20/255, green: 20/255, blue: 20/255))

                                HStack {
                                    Capsule()
                                        .frame(width: 100, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == .suggestions ? 1 : 0)
                                        .overlay {
                                            Text(Menu.suggestions.rawValue)
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            self.menu = .suggestions
                                        }
                                    Capsule()
                                        .frame(width: 70, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == .friends ? 1 : 0)
                                        .overlay {
                                            Text(Menu.friends.rawValue)
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            self.menu = .friends
                                        }
                                    Capsule()
                                        .frame(width: 75, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == .requests ? 1 : 0)

                                        .overlay {
                                            Text(Menu.requests.rawValue)
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            self.menu = .requests
                                        }
                                }
                            }
                        }
                        .zIndex(1)


                        LinearGradient(colors: [.black, .white.opacity(0)], startPoint: .bottom, endPoint: .top)
                            .ignoresSafeArea()
                            .frame(height: 60)
                            .opacity(0.9)
                    }
                }
            }
        }
    }
}

#Preview {
    LeftMenu(mainMenu: .constant(.left))
}
