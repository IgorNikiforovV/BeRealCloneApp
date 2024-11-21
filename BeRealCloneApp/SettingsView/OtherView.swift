//
//  OtherView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 14.11.2024.
//

import SwiftUI

struct OtherView: View {
    @Environment(\.dismiss) var dismiss
    @State var fastCamera = false

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
                                Toggle(isOn: $fastCamera) {}
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }

                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))

                            HStack {
                                Image(systemName: "xmark.app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                Text("Clear cache")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }

                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))

                            HStack {
                                Spacer()

                                Text("Delete Account")
                                    .foregroundStyle(.red)

                                Spacer()
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    OtherView()
}
