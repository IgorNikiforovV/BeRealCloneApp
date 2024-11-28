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
    SelectCountryView()
}
