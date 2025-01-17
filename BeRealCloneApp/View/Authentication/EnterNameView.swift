//
//  EnterNameView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 24.11.2024.
//

import SwiftUI

struct EnterNameView: View {
    @Binding var name: String
    @State var buttonActive = false

    @Binding var nameButtonClicked: Bool

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

                VStack {
                    VStack(alignment: .center, spacing: 8) {
                        Text("Let's get started, what's your name? ")
                            .fontWeight(.heavy)
                            .font(.system(size: 16))

                        Text("Your name")
                            .opacity(name.isEmpty ? 1 : 0)
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 210)
                            .overlay {
                                TextField("", text: $name)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                    }
                    .foregroundColor(.white)

                    Spacer()
                }
                .padding(.top, 50)

                VStack {
                    Spacer()
                    Button {
                        nameButtonClicked = buttonActive
                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, title: "Continue")
                            .onChange(of: name) { oldValue, newValue in
                                buttonActive = !newValue.isEmpty
                            }
                    }

                }
            }
        }
    }
}

#Preview {
    EnterNameView(name: .constant("Test"), nameButtonClicked: .constant(false))
}
