//
//  SearchBar.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 01.11.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    @FocusState var focusedField: Int?

    var body: some View {
        HStack {
            TextField("", text: $text)
                .padding(8)
                .frame(height: 50)
                .padding(.horizontal, 24)
                .foregroundColor(.white)
                .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                .cornerRadius(8)
                .focused($focusedField, equals: 1)
                .overlay (
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: 25, alignment: .leading)
                        Text(text.isEmpty ? "Add or search friends" : "")
                            .foregroundStyle(.gray)
                            .padding(.leading, -4)
                        Spacer()
                    }
                        .padding(.leading, 4)
                )
            if isEditing {
                Button {
                    self.text = ""
                    self.focusedField = nil
                    self.isEditing = false
                    UIApplication.shared.endEditing()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.white)

                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .onTapGesture {
            self.isEditing = true
            self.focusedField = 1
        }
    }
}

#Preview {
    SearchBar(text: .constant(""), isEditing: .constant(true))
}
