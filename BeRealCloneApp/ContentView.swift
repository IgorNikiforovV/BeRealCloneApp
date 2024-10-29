//
//  ContentView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 08.10.2024.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        EditProfile()
    }
}

#Preview {
    ContentView()
}
