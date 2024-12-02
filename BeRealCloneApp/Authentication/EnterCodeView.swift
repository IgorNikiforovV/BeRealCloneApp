//
//  EnterCodeView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 02.12.2024.
//

import SwiftUI
import Combine

struct EnterCodeView: View {
    @State var otpCode = ""

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
                    VStack {
                        VStack(alignment: .center, spacing: 8){
                            Text("Enter the code we sent to +7 958 882 47")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))

                            Text(" ...... ")
                                .foregroundStyle(.gray)
                                .opacity(0.8)
                                .font(.system(size: 70))
                                .padding(.top, -40)
                                .opacity(otpCode.isEmpty ? 1 : 0)
                                .overlay {
                                    TextField("", text: $otpCode)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 24, weight: .heavy))
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(otpCode), perform: { _ in
                                            limitText(6)
                                        })
                                        .onReceive(Just(otpCode), perform: { newValue in
                                            let filtered = newValue.filter {
                                                Set("0123456789").contains($0)
                                            }
                                            if filtered != newValue {
                                                otpCode = filtered
                                            }
                                        })
                                }
                        }
                    }
                }
            }
        }
    }

    func limitText(_ upper: Int) {
        if otpCode.count > upper {
            otpCode = String(otpCode.prefix(upper))
        }
    }
}

#Preview {
    EnterCodeView()
}
