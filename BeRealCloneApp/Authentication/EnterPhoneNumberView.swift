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
                            .overlay {
                                TextField("", text: $phoneNumber)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                            }

                    }

                    Spacer()
                }
                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    EnterPhoneNumberView()
}
