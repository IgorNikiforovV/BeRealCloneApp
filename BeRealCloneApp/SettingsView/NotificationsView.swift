//
//  NotificationsView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 21.11.2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {

                    ZStack {
                        Text("Notifications")
                            .fontWeight(.semibold)
                        HStack {
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 20))

                            Spacer()
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .foregroundColor(.white)

                VStack {

                    VStack {

                        HStack {
                            Text("On BeReal, you're in control of your push notification")
                            Spacer()
                        }

                        HStack {
                            Text("You can choose the type of notifications you wont to receive")
                            Spacer()
                        }


                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                }
                .padding(.horizontal)

                VStack(spacing: 14) {

//                    VStack {
//                        NotificationsButtonView(icon: <#T##String#>, text: <#T##String#>, toggle: <#T##Binding<Bool>#>)
                   // }
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
