//
//  RequestView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 10.11.2024.
//

import SwiftUI

struct RequestView: View {
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
                            Text("FINDING REQUEST (0)")
                                .foregroundStyle(Color(red: 205/255, green: 204/255, blue: 209/255))
                                .font(.system(size: 14))

                            Spacer()

                            HStack {
                                Text("Sent")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                        }

                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: 90)
                            .foregroundColor(Color( red: 28/255, green: 28/255, blue: 30/255))
                            .overlay {
                                VStack (spacing: 8) {
                                    HStack {
                                        Spacer()
                                        Text("No pending requests")
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                        Spacer()
                                    }

                                    HStack {
                                        Spacer()
                                        Text("You don't have any pending requests.")
                                            .foregroundStyle(.white)
                                        Spacer()
                                    }
                                }
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
    RequestView()
}
