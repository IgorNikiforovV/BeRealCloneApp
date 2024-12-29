//
//  SuggestionCellView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 06.11.2024.
//

import SwiftUI

struct SuggestionCellView: View {
    var body: some View {
        HStack {
            Image("photo")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .cornerRadius(65/2)

            VStack(alignment: .leading) {
                Text("Igor")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text("Niki")
                    .foregroundStyle(.gray)
                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    Text("Igor")
                        .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        .padding(.leading, -4)
                }
            }

            Spacer()

            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
                .frame(width: 45, height: 25)
                .overlay {
                    Text("ADD")
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }

            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SuggestionCellView()
}
