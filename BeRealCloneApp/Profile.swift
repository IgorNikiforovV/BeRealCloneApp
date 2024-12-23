//
//  Profile.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 16.10.2024.
//

import SwiftUI
import Kingfisher

struct Profile: View {
    @Binding var mainMenu: MainMenu
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                mainMenu = .feed
                            }
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }


                        Spacer()
                        
                        Text("Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        Spacer()

                        NavigationLink {
                            SettingsView().navigationBarBackButtonHidden()
                        } label: {
                            ThreeDots(size: 4, color: .white)
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }

                VStack {
//                    Image("photo")
//                        .resizable()
//                        //.scaledToFit()
//                        .frame(width: 130, height: 130)
//                        .cornerRadius(75)
                    if let profileImage = viewModel.currentUser?.profileImageUrl {
                        KFImage(URL(string: profileImage))
                            .resizable()
                            .frame(width: 130, height: 130)
                            .cornerRadius(75)
                    } else {
                        Circle()
                            .frame(width: 130, height: 130)
                            .cornerRadius(75)
                            .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                            .overlay {
                                Text((viewModel.currentUser?.fullname ?? "").prefix(1))
                                    .foregroundStyle(.white)
                                    .font(.system(size: 55))
                            }
                    }

                    Text(viewModel.currentUser?.fullname ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)

                    Text(viewModel.currentUser?.username ?? viewModel.currentUser?.fullname.lowercased() ?? "")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)

                    HStack {
                        Text("Your Memories")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))

                        Spacer()

                        HStack(spacing: 4) {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 10))

                            Text("Only Visible to you")
                                .foregroundColor(.gray)
                                .font(.system(size: 10))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 4)

                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                                .opacity(0.07)
                                .frame(height: 230)

                            VStack {
                                HStack {
                                    Text("Last 14 days")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16))
                                        .padding(8)
                                    Spacer()
                                }
                                .padding(.leading)

                                VStack {
                                    HStack(spacing: 4) {
                                        ForEach(1..<8) { x in
                                            MemoryView(day: x)
                                        }
                                    }
                                    HStack(spacing: 4) {
                                        ForEach(1..<8) { x in
                                            MemoryView(day: x + 7)
                                        }
                                    }
                                    .padding(.top, -4)
                                }
                                .padding(.top, -4)

                                Text("View all my Memories")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 13))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 2)
                                            .frame(width: 175, height: 20)
                                            .opacity(0.5)
                                    )
                                    .padding(.top, 4)
                            }
                            .padding(.top, -15)
                        }
                    }
                    Text("🔗 BeRe.al/niki")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                        .padding(.top, 8)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Profile(mainMenu: .constant(.profile))
}
