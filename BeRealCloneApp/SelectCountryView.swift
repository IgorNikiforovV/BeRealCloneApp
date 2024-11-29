//
//  SelectCountryView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 28.11.2024.
//

import SwiftUI

struct SelectCountryView: View {
    var counries: [Country] = Country.allCountries
    @State var countryChosen: Country = Country(isoCode: "")
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Select Country")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }

                            Spacer()
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal)

                VStack {
                    VStack {
                        List {
                            Section {
                                ForEach(counries, id: \.isoCode) { country in
                                    HStack {
                                        Text("\(country.flag(country: country.isoCode)) \(country.localizedName) (+\(country.phoneCode))")

                                        Spacer()
                                        if country.isoCode == countryChosen.isoCode {
                                            Image(systemName: "checkmark.circle")
                                        }
                                    }
                                    .onTapGesture {
                                        countryChosen = country
                                        dismiss()
                                    }
                                }
                            } header: {
                                Text("SUGGESTED")
                                    .padding(.leading, -8)
                                    .font(.system(size: 12))
                            }
                        }
                    }
                }
                .padding(.top, 50)

            }
            .environment(\.colorScheme, .dark)
        }
    }
}

#Preview {
    SelectCountryView()
}
