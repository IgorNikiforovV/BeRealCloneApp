//
//  HelpView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 16.11.2024.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Help")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }

                            Spacer()
                        }
                    }

                    Spacer()
                }

                VStack {
                    VStack(spacing: 16) {
                        NavigationLink {
                            ContactUsView().navigationBarBackButtonHidden()
                        } label: {
                            ChevronButtonView(icon: "envelope", text: "Contact us")
                        }

                        NavigationLink {
                            
                        } label: {
                            ChevronButtonView(icon: "questionmark.circle", text: "Help Center")
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }
            }
        }
    }
}

#Preview {
    HelpView()
}
