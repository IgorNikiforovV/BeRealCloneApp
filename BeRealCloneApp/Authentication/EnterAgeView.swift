//
//  EnterAgeView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 25.11.2024.
//

import SwiftUI
import Combine

struct EnterAgeView: View {

    @State var day = ""
    @State var month = ""
    @State var year = ""

    @Binding var ageButtonClicked: Bool
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
                    Text("He, when's your birthday?")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))

                    HStack(spacing: 4) {
                        Text("DD")
                            .opacity(day.isEmpty ? 1 : 0)
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 45))
                            .frame(width: 65)
                            .overlay {
                                TextField("", text: $day)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(day), perform: { newValue in
                                        let filtrered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtrered != newValue {
                                            self.day = filtrered
                                        }
                                    })
                                    .onReceive(Just(day), perform: { _ in
                                        if day.count > 2 {
                                            day = String(day.prefix(2))
                                        }
                                    })
                            }

                        Text("MM")
                            .opacity(month.isEmpty ? 1 : 0)
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 45))
                            .frame(width: 80)
                            .overlay {
                                TextField("", text: $month)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(month), perform: { newValue in
                                        let filtrered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtrered != newValue {
                                            self.month = filtrered
                                        }
                                    })
                                    .onReceive(Just(month), perform: { _ in
                                        if month.count > 2 {
                                            month = String(month.prefix(2))
                                        }
                                    })
                            }

                        Text("YYYY")
                            .opacity(year.isEmpty ? 1 : 0)
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 45))
                            .frame(width: 127)
                            .overlay {
                                TextField("", text: $year)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(year), perform: { newValue in
                                        let filtrered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtrered != newValue {
                                            self.year = filtrered
                                        }
                                    })
                                    .onReceive(Just(year), perform: { _ in
                                        if year.count > 4 {
                                            year = String(year.prefix(4))
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
                            .onChange(of: month) { oldValue, newValue in
                                buttonActive = !newValue.isEmpty
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    EnterAgeView(ageButtonClicked: .constant(false))
}
