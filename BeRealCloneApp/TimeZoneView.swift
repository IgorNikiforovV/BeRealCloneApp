//
//  TimeZoneView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 30.10.2024.
//

import SwiftUI

struct TimeZoneView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Time Zone")
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

                    VStack {
                        HStack {
                            Text("Select your Time Zone")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            Spacer()
                        }

                        HStack {
                            Text("To receive your BeReal notification during daytime, select your time zone. When changing your time zone, your current BeReal will be deleted. You can only change time zones once a day.")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 14))

                            Spacer()
                        }
                        .padding(.top, -8)
                    }

                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 190)
                                .foregroundColor(.white)
                                .opacity(0.07 )

                            VStack {
                                Button {

                                } label: {
                                    HStack {
                                        Image(systemName: "globe.europe.africa.fill")
                                            .foregroundColor(.white)
                                        Text("Europe")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Spacer()
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TimeZoneView()
}
