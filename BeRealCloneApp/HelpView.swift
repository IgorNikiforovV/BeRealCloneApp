//
//  HelpView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 16.11.2024.
//

import SwiftUI

struct HelpView: View {
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
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                        }
                    }

                    Spacer()
                }

                VStack {
                    VStack(spacing: 16) {
                        ChevronButtonView(icon: "envelope", text: "Contact us")
                        ChevronButtonView(icon: "questionmark.circle", text: "Help Center")
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
