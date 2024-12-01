//
//  EnterPhoneNumberView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 30.11.2024.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    @State var country = Country(isoCode: "US")
    @State var showCountryList = false
    @State var phoneNumber = ""
    @State var buttonActive = false

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {

                    HStack {
                        Spacer()
                        Text("BeReal.")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))

                        Spacer()
                    }

                    Spacer()
                }

                VStack(alignment: .center, spacing: 8) {
                    Text("Create your account using your phone number")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))

                    HStack {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 1)
                            .frame(width: 75,height: 45)
                            .foregroundColor(.gray)
                            .overlay {
                                Text("\(country.flag(country: country.isoCode))")
                                +
                                Text("+\(country.phoneCode)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                            }
                            .onTapGesture {
                                showCountryList.toggle()
                            }

                        Text("Your Phone")
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 220)
                            .opacity(phoneNumber.isEmpty ? 1 : 0)
                            .overlay {
                                TextField("", text: $phoneNumber)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                            }

                    }
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)

                    Spacer()
                }
                .padding(.top, 50)

                VStack {
                    Spacer()

                    Text("By tapping \"Continue\", you agree to our Privacy Policy and Terms of Secvice.")
                        .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)

                    Button {

                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, title: "Continue")
                            .onChange(of: phoneNumber) { _, newValue in
                                buttonActive = !newValue.isEmpty
                            }
                    }
                    .disabled(phoneNumber.isEmpty)
                }
            }
        }
        .sheet(isPresented: $showCountryList) {
            SelectCountryView(countryChosen: $country)
        }
        .environment(\.colorScheme, .dark)

    }
}

#Preview {
    EnterPhoneNumberView()
}
