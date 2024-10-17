//
//  Profile.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 16.10.2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                        Text("Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        Spacer()

                        ThreeDots(size: 4, color: .white)
                    }
                    .padding(.horizontal)
                    Spacer()
                }

                VStack {
                    Image("photo")
                        .resizable()
                        //.scaledToFit()
                        .frame(width: 130, height: 130)
                        .cornerRadius(75)

                    Text("Igor")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)

                    Text("Niki")
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
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Profile()
}
