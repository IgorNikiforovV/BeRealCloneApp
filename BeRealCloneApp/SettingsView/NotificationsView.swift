//
//  NotificationsView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 21.11.2024.
//

import SwiftUI

struct NotificationsView: View {
    @State var mentions = false
    @State var comments = false
    @State var friendRequests = false
    @State var lateBeReal = false
    @State var realMojis = false

    @State var buttonActive = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {

                    ZStack {
                        Text("Notifications")
                            .fontWeight(.semibold)
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .font(.system(size: 20))
                            }


                            Spacer()
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .foregroundColor(.white)

                VStack {

                    VStack {

                        HStack {
                            Text("On BeReal, you're in control of your push notification")
                            Spacer()
                        }

                        HStack {
                            Text("You can choose the type of notifications you wont to receive")
                            Spacer()
                        }


                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)

                    VStack(spacing: 14) {

                        VStack {
                            NotificationsButtonView(
                                icon: "person.crop.square.filled.and.at.rectangle",
                                text: "Mentions",
                                toggle: $mentions
                            )

                            HStack {
                                Text("dilaysila mentioned you on seanlund's BeReal.")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }

                        VStack {
                            NotificationsButtonView(
                                icon: "bubble.left.fill",
                                text: "Comments",
                                toggle: $comments
                            )

                            HStack {
                                Text("ercimmiyal commented on your BeReal.")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }

                        VStack {
                            NotificationsButtonView(
                                icon: "person.2.fill",
                                text: "FriendRequests",
                                toggle: $friendRequests
                            )

                            HStack {
                                Text("ercimmiyal just send vou a friend request.")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }

                        VStack {
                            NotificationsButtonView(
                                icon: "timer",
                                text: "Late BeReal",
                                toggle: $lateBeReal
                            )

                            HStack {
                                Text("zeymustu just posted late.")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }

                        VStack {
                            NotificationsButtonView(
                                icon: "face.smiling.fill",
                                text: "Real Mojies",
                                toggle: $realMojis
                            )

                            HStack {
                                Text("ogulcansatafoglu just reacted to your BeReal.")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 8)

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 50)



                VStack {
                    Spacer()
                    WhiteButtonView(buttonActive: $buttonActive, title: "Save")
                        .onChange(of: mentions || comments || friendRequests || lateBeReal || realMojis) { _, _ in
                            self.buttonActive = true
                        }
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
