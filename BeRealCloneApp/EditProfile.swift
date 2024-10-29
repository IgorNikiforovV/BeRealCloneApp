//
//  EditProfile.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 24.10.2024.
//

import SwiftUI

struct EditProfile: View {
    @State var width = UIScreen.main.bounds.width

    @State var fullname = ""
    @State var username = ""
    @State var bio = ""
    @State var location = ""

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ZStack {
                        HStack {
                            Text("Cancel")
                                .foregroundStyle(.white)
                            Spacer()

                            Text("Save")
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal, width * 0.05)
                        Text("Edit Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }

                    ZStack {
                        HStack {
                            Spacer()
                            Rectangle()
                                .frame(width: width * 0.95, height: 0.7)
                                .foregroundColor(.gray)
                                .opacity(0.5)
                        }
                    }
                    Spacer()
                }
                
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Image("photo")
                            .resizable()
                            .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 120, height: 120)
                            .cornerRadius(60)
                        ZStack {
                            ZStack {
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(.black)
                                Circle()
                                    .frame(width: 30 , height: 30)
                                    .foregroundColor(.white)
                                Circle()
                                    .frame(width: 30 , height: 30)
                                    .foregroundColor(.black)
                                    .opacity(0.1)
                            }
                            Image(systemName: "camera.fill")
                                .font(.system(size: 16))
                                .shadow(color: .white, radius: 1, x: 1, y: 1)
                        }
                    }

                    // MENU
                    VStack {
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)

                        HStack {
                            HStack {
                                Text("Full name")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $fullname)
                                    .font(.system(size: 16))
                                    .paceholder(when: fullname.isEmpty) {
                                        Text("Igor").foregroundStyle(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)

                        HStack {
                            HStack {
                                Text("Username")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $username)
                                    .font(.system(size: 16))
                                    .paceholder(when: username.isEmpty) {
                                        Text("Niki").foregroundStyle(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)

                        HStack(alignment: .top) {
                            HStack {
                                Text("Bio")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .padding(.leading, -4)
                            .frame(width: width * 0.2)

                            //if #available(ios 16, *) {
                            TextEditor(text: $bio)
                                .foregroundColor(.white)
                                .background(.clear)
                                .scrollContentBackground(.hidden)
                                .frame(height: 100)
                                .padding(.leading, width * 0.05)
                                .overlay (
                                    VStack {
                                        HStack {
                                            if bio.isEmpty {
                                                Text("Bio")
                                                    .foregroundStyle(.gray)
                                                    .font(.system(size: 16))
                                                    .zIndex(1)
                                                    .padding(.top, 8)
                                                    .padding(.leading, 24)
                                            }
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                )
                                .padding(.top, -8)
                                .frame(width: width * 0.63)
                            //}
                        }

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)

                        HStack {
                            HStack {
                                Text("Location")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $location)
                                    .font(.system(size: 16))
                                    .paceholder(when: username.isEmpty) {
                                        if location.isEmpty {
                                            Text("Location").foregroundStyle(.gray)
                                                .font(.system(size: 16))
                                        }
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)
                    Spacer()
                }
                .padding(.top, UIScreen.main.bounds.height * 0.08)
            }
        }
    }
}

#Preview {
    EditProfile()
}
