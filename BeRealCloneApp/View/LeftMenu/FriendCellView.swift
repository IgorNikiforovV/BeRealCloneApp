//
//  FriendCellView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 07.11.2024.
//

import SwiftUI

struct FriendCellView: View {
    var body: some View {
        HStack {
            Image("photo")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .cornerRadius(65/2)

            VStack(alignment: .leading) {
                Text("Sergey")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text("braun")
                    .foregroundStyle(.gray)
            }

            Spacer()

            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

#Preview {
    FriendCellView()
}
