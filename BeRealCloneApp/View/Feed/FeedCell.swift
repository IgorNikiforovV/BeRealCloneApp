//
//  FeedCell.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 12.10.2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading) {
                // USRENAME
                HStack {
                    Image("photo")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text("igor")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        Text("Perm •  5 hr late")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)

                // IMAGE
                ZStack {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "bubble.left.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                                Image(systemName: "face.smiling.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                                    .padding(.top, 15)
                            }
                            .padding(.trailing, 20)
                            .padding(.bottom, 50)
                        }
                    }
                    .zIndex(1)

                    VStack {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        HStack {
                            Text("Add a comment...")
                                .foregroundStyle(.gray)
                                .fontWeight(.semibold)
                                .padding(.leading, 8)
                            Spacer()
                        }
                    }
                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.black)
                                .frame(width: 125, height: 165)
                                .overlay(
                                    Image("me")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .frame(width: 120, height: 160))
                                .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.top, 18)
                        Spacer()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
        }
    }
}

#Preview {
    FeedCell()
}
