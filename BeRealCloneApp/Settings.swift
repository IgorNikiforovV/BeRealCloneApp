//
//  Settings.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 21.10.2024.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Settings")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        HStack {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }

                VStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 90)
                        .foregroundColor(.white)
                        .opacity(0.07)
                        .overlay(
                            HStack {
                                Image("photo")
                                    .resizable()
                                    .scaledToFit()
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
                                .padding(.horizontal, 17)
                        )
                }
            }

        }
    }
}

#Preview {
    Settings()
}
