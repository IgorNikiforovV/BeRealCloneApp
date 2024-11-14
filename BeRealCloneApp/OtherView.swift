//
//  OtherView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 14.11.2024.
//

import SwiftUI

struct OtherView: View {
    @State var toggle = false

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Other")
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
                    VStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))

                            HStack {
                                Image(systemName: "camera.viewfinder")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                Text("fast Camera (reduces quality)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                    Spacer()
                                Toggle(isOn: $toggle) {

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
    OtherView()
}
