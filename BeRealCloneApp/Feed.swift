//
//  Feed.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 08.10.2024.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ZStack {
                VStack {
                    VStack {
                        HStack {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.white)
                            Spacer()

                            Text("BeReal")
                                .foregroundStyle(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 22))
                            Spacer()

                            Image("photo")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(17.5)
                        }
                        .padding(.horizontal)
                        HStack {
                            Text("My Friends")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                            Text("Discovery")
                                .foregroundStyle(.gray)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Feed()
}
