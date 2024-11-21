//
//  SettingsView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 21.10.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss

    @State var width = UIScreen.main.bounds.width

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.black.ignoresSafeArea()

                    VStack {
                        ZStack {
                            Text("Settings")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)

                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "arrow.backward")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }

                                Spacer()
                            }
                        }
                        .padding(.horizontal)

                        Spacer()
                    }

                    VStack {
                        NavigationLink {
                            EditProfileView().navigationBarBackButtonHidden()
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 90)
                                .foregroundColor(.white)
                                .opacity(0.07)
                                .overlay(
                                    HStack {
                                        Image("photo")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(30)

                                        VStack(alignment: .leading) {
                                            Text("Igor")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 18))
                                            Text("niki")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 14))
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                        .padding(.horizontal, 18)
                                )
                        }


                        VStack(spacing: 6) {
                            HStack {
                                Text("FEATURES")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                Spacer()
                            }

                            NavigationLink {
                                MemoriesView().navigationBarBackButtonHidden()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: width * 0.9, height: 45)
                                        .foregroundColor(.white)
                                        .opacity(0.07)

                                    HStack {
                                        Spacer()
                                        Image(systemName: "calendar")
                                            .foregroundColor(.white)
                                        Text("Memories")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                    }
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)
                                }
                            }

                        }
                        .padding(.top, 12)

                        VStack(spacing: 6) {
                            HStack {
                                Text("SETTINGS")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                Spacer()
                            }

                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(width: width * 0.9, height: 145)
                                    .foregroundColor(.white)
                                    .opacity(0.07)

                                VStack {
                                    NavigationLink(destination: {
                                        NotificationsView().navigationBarBackButtonHidden()
                                    }, label: {
                                        HStack {
                                            Image(systemName: "square.and.pencil")
                                                .foregroundColor(.white)

                                            Text("Notification")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    })
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink(destination: {
                                        TimeZoneView().navigationBarBackButtonHidden()
                                    }, label: {
                                        HStack {
                                            Image(systemName: "globe.europe.africa.fill")
                                                .foregroundColor(.white)

                                            Text("Time Zone: Europe")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    })
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink(destination: {
                                        OtherView().navigationBarBackButtonHidden()
                                    }, label: {
                                        HStack {
                                            Image(systemName: "hammer.circle")
                                                .foregroundColor(.white)

                                            Text("Other")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    })
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)
                                }
                            }
                        }
                        .padding(.top, 12)

                        VStack(spacing: 6) {
                            HStack {
                                Text("ABOUT")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                Spacer()
                            }

                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(width: width * 0.9, height: 190)
                                    .foregroundColor(.white)
                                    .opacity(0.07)

                                VStack {
                                    NavigationLink(destination: {

                                    }, label: {
                                        HStack {
                                            Image(systemName: "square.and.arrow.up")
                                                .foregroundColor(.white)

                                            Text("Share BeReal")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    })
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink(destination: {

                                    }, label: {
                                        HStack {
                                            Image(systemName: "star")
                                                .foregroundColor(.white)

                                            Text("Rate BeReal")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    })
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink(destination: {
                                        HelpView().navigationBarBackButtonHidden()
                                    }, label: {
                                        HStack {
                                            Image(systemName: "lifepreserver")
                                                .foregroundColor(.white)

                                            Text("Help")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    })
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink(destination: {

                                    }, label: {
                                        HStack {
                                            Image(systemName: "info.circle")
                                                .foregroundColor(.white)

                                            Text("About")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    })
                                    .padding(.horizontal, width * 0.1)
                                    .frame(height: 30)
                                }
                            }
                        }
                        .padding(.top, 12)

                        // LOGOUT
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: width * 0.9, height: 45)
                                .foregroundColor(.white)
                                .opacity(0.07)

                            HStack {
                                Text("Log Out")
                                    .foregroundStyle(.red)
                            }
                            .padding(.horizontal, width * 0.1)
                            .frame(height: 30)
                        }
                        .padding(.top, 12)
                        Text("Version 1.23.0 (8356) - Production")
                            .foregroundStyle(.gray)
                            .font(.system(size: 12))
                            .padding(.top, 12)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SettingsView()
}
