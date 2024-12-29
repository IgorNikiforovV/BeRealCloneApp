//
//  FriendsView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 07.11.2024.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 65)
                        .foregroundColor(Color(red: 40/255, green: 40/255, blue: 35/255))
                        .overlay {
                            HStack {
                                Image("photo")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(20)

                                VStack(alignment: .leading) {
                                    Text("Invite friends on BeReal")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)

                                    Text("bere.al/igor")
                                        .foregroundStyle(.gray)
                                }
                                Spacer()

                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))


                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)

                    VStack {
                        HStack {
                            Text("MY FRIENDS (45)")
                                .foregroundStyle(Color(red: 205/255, green: 204/255, blue: 209/255))
                                .font(.system(size: 14))

                            Spacer()
                        }

                        ForEach(1..<16) { _ in
                            FriendCellView()
                        }
                    }
                    .padding(.top)

                    Spacer()
                }
                .padding(.top, 20)
            }
            .padding(.top, 110)
        }
    }
}

#Preview {
    FriendsView()
}
