//
//  TimeZoneView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 30.10.2024.
//

import SwiftUI

struct TimeZoneView: View {

    @State var area = "europe"

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
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 193)
                                .foregroundColor(.white)
                                .opacity(0.07 )

                            VStack {
                                Button {
                                    self.area = "europe"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.europe.africa.fill")
                                            .foregroundColor(.white)
                                        Text("Europe")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        if self.area == "europe" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }

                                HStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                    .foregroundColor(.gray)
                                }

                                Button {
                                    self.area = "americas"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.americas.fill")
                                            .foregroundColor(.white)
                                        Text("Americas")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        if self.area == "americas" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }

                                HStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                    .foregroundColor(.gray)
                                }

                                Button {
                                    self.area = "eastasia"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundColor(.white)
                                        Text("East Asia")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        if self.area == "eastasia" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }

                                HStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                    .foregroundColor(.gray)
                                }

                                Button {
                                    self.area = "westasia"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundColor(.white)
                                        Text("West Asia")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        if self.area == "westasia" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                            }
                        }
                        .padding(.top)
                    }

                    Spacer()

                    Button {

                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 45)
                            .foregroundStyle(Color(red: 86/255, green: 86/255, blue: 88/255))
                            .overlay {
                                Text("Save")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 14))
                            }
                    }

                }
                .padding(.top, 50)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TimeZoneView()
}
