//
//  MemoriesView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 18.11.2024.
//

import SwiftUI

struct MemoriesView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Memories")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        HStack {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))

                            Spacer()

                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                        }
                    }

                    Spacer()
                }

                VStack {
                    VStack {
                        HStack {
                            Text("Your memories are activated")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))

                            Spacer()
                        }


                        Text("All your BeReal are automatically added to your Memories and only visible by you.")
                            .foregroundStyle(.white)
                            .padding(.top, -2)
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 210)
                            .foregroundColor(Color(red: 22/255, green: 4/255, blue: 3/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.red, lineWidth: 1)
                            }

                        VStack() {

                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50)

            }
        }
    }
}

#Preview {
    MemoriesView()
}
