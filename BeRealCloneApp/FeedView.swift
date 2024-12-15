//
//  Feed.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 08.10.2024.
//

import SwiftUI

struct FeedView: View {
    @Binding var mainMenu: MainMenu

    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                ZStack {
                    ScrollView {
                        VStack {
                            VStack {
                                ZStack {
                                    VStack(alignment: .leading) {
                                        Image("back")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(5)
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Image("me")
                                                .resizable()
                                                .scaledToFit()
                                                .border(.black)
                                                .cornerRadius(2)
                                                .frame(width: 20, height: 40)
                                                .padding(.leading)
                                            Spacer()
                                        }
                                        .padding(.top, 18)
                                        Spacer()
                                    }
                                }
                                .frame(width: 100)
                            }
                            VStack {
                                Text("Add a caption...")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                Text("View Comment")
                                    .foregroundStyle(.gray)
                                HStack {
                                    Text("Perm, Perm-South • 1 hr late")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 12))
                                    ThreeDots(size: 3, color: .gray)
                                }
                            }
                            ForEach(1..<8) { _ in
                                FeedCell()
                            }
                        }
                        .padding(.top, 80)
                    }

                    VStack {
                        VStack {
                            HStack {
                                Button {
                                    withAnimation {
                                        mainMenu = .left
                                    }
                                } label: {
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.white)
                                }

                                Spacer()

                                Text("BeReal")
                                    .foregroundStyle(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 22))
                                Spacer()

                                Button {
                                    withAnimation {
                                        mainMenu = .profile
                                    }
                                } label: {
                                    Circle()
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(17.5)
                                        .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                        .overlay {
                                            Text((viewModel.currentUser?.fullname ?? "").prefix(1).uppercased())
                                                .foregroundStyle(.white)
                                                .font(.system(size: 15))
                                        }

//                                    Image("photo")
//                                        .resizable()
//                                        .frame(width: 35, height: 35)
//                                        .cornerRadius(17.5)
                                }

                            }
                            .padding(.horizontal)
                            HStack {
                                Text("My Friends")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                Text("Discovery")
                                    .foregroundStyle(.gray)
                            }
                        }
                        Spacer()
                    }
                }
        }
    }
}

#Preview {
    FeedView(mainMenu: .constant(.feed))
}
