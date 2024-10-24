//
//  EditProfile.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 24.10.2024.
//

import SwiftUI

struct EditProfile: View {
    @State var width = UIScreen.main.bounds.width
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
                            .frame(width: width * 0.95, height: 0.7)
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
                                //TextField
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfile()
}
