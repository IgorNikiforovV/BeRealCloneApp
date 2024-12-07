//
//  EnterAgeView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 25.11.2024.
//

import SwiftUI
import Combine

struct EnterAgeView: View {

    @Binding var year: Year
    @Binding var name: String

    @Binding var ageButtonClicked: Bool
    @State var buttonActive = false

    @EnvironmentObject var viewModel: AuthenticationViewModel

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
                    Text("Hi \(name), when's your birthday?")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))

                    HStack(spacing: 4) {
                        Text("DD")
                            .opacity(year.day.isEmpty ? 1 : 0)
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 45))
                            .frame(width: 65)
                            .overlay {
                                TextField("", text: $year.day)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(year.day), perform: { newValue in
                                        let filtrered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtrered != newValue {
                                            self.year.day = filtrered
                                        }
                                    })
                                    .onReceive(Just(year.day), perform: { _ in
                                        if year.day.count > 2 {
                                            year.day = String(year.day.prefix(2))
                                        }
                                    })
                            }

                        Text("MM")
                            .opacity(year.month.isEmpty ? 1 : 0)
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 45))
                            .frame(width: 80)
                            .overlay {
                                TextField("", text: $year.month)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(year.month), perform: { newValue in
                                        let filtrered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtrered != newValue {
                                            self.year.month = filtrered
                                        }
                                    })
                                    .onReceive(Just(year.month), perform: { _ in
                                        if year.month.count > 2 {
                                            year.month = String(year.month.prefix(2))
                                        }
                                    })
                            }

                        Text("YYYY")
                            .opacity(year.year.isEmpty ? 1 : 0)
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 45))
                            .frame(width: 127)
                            .overlay {
                                TextField("", text: $year.year)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(year.year), perform: { newValue in
                                        let filtrered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtrered != newValue {
                                            self.year.year = filtrered
                                        }
                                    })
                                    .onReceive(Just(year.year), perform: { _ in
                                        if year.year.count > 4 {
                                            year.year = String(year.year.prefix(4))
                                        }
                                    })
                            }
                    }

                    Spacer()
                }
                .padding(.top, 50)

                VStack {
                    Spacer()

                    Text("Only to make sure you're old enough to use BeReal.")
                        .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255) )
                        .fontWeight(.semibold)
                        .font(.system(size: 14))

                    Button {
                        ageButtonClicked = buttonActive
                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, title: "Continue")
                            .onChange(of: year.month) { oldValue, newValue in
                                buttonActive = !newValue.isEmpty
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    EnterAgeView(year: .constant(Year(day: "09", month: "10", year: "1985")), name: .constant("Test"), ageButtonClicked: .constant(false))
}
