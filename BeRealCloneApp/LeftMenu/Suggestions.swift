//
//  Suggestions.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 06.11.2024.
//

import SwiftUI

struct Suggestions: View {
    var body: some View {
        VStack {

            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 65)
                        .foregroundColor(Color(red: 40/255, green: 40/255, blue: 35/255))
                        .overlay {
                            HStack {
                                Image("photo")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(20)

                                VStack(alignment: .leading) {
                                    Text("Invite friends on BeReal")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)

                                    Text("bere.al/igor")
                                        .foregroundStyle(.gray)
                                }
                                Spacer()

                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))


                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                    VStack {
                        HStack {
                            Text("ADD YOUR CONTACTS")
                                .foregroundColor(Color(red: 205/255, green: 204/255, blue: 209/255))
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                                Spacer()
                        }

                        
                    }
                }
            }
        }
    }
}

#Preview {
    Suggestions()
}
