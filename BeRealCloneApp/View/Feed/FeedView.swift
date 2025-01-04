//
//  Feed.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 08.10.2024.
//

import SwiftUI
import Kingfisher

struct FeedView: View {
    @Binding var mainMenu: MainMenu

    @EnvironmentObject var viewModel: AuthenticationViewModel

    @State var cameraViewPresented = false

    @ObservedObject var feedModel: FeedViewModel

    init(feedModel: FeedViewModel, menu: Binding<MainMenu>) {
        self.feedModel = feedModel
        self._mainMenu = menu
    }

    var body: some View {
        VStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                    ZStack {
                        ScrollView {
                            VStack {
                                VStack {
                                    ZStack {
                                        VStack(alignment: .leading) {
                                            Image("back")
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(5)
                                        }

                                        VStack {
                                            HStack {
                                                Image("me")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .border(.black)
                                                    .cornerRadius(2)
                                                    .frame(width: 20, height: 40)
                                                    .padding(.leading)
                                                Spacer()
                                            }
                                            .padding(.top, 18)
                                            Spacer()
                                        }
                                    }
                                    .frame(width: 100)
                                }
                                VStack {
                                    Text("Add a caption...")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                    Text("View Comment")
                                        .foregroundStyle(.gray)
                                    HStack {
                                        Text("Perm, Perm-South • 1 hr late")
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 12))
                                        ThreeDots(size: 3, color: .gray)
                                    }
                                }
                                ForEach(self.feedModel.bereals, id: \.backImageUrl) { bereal in
                                    FeedCell(
                                        bereal: bereal,
                                        blur: feedModel.blur,
                                        viewModel: FeedCellViewModel(bereal: bereal)
                                    )
                                        .onAppear {
                                            print("BEREAL: \(bereal.username)")
                                        }
                                }
                            }
                            .padding(.top, 80)
                        }

                        VStack {
                            VStack {
                                HStack {
                                    Button {
                                        withAnimation {
                                            mainMenu = .left
                                        }
                                    } label: {
                                        Image(systemName: "person.2.fill")
                                            .foregroundColor(.white)
                                    }

                                    Spacer()

                                    Text("BeReal")
                                        .foregroundStyle(.white)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(.system(size: 22))
                                    Spacer()

                                    Button {
                                        withAnimation {
                                            mainMenu = .profile
                                        }
                                    } label: {
                                        if let profileImage = viewModel.currentUser?.profileImageUrl {
                                            KFImage(URL(string: profileImage))
                                                .resizable()
                                                .frame(width: 35, height: 35)
                                                .cornerRadius(17.5)
                                        } else {
                                            Circle()
                                                .frame(width: 35, height: 35)
                                                .cornerRadius(17.5)
                                                .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                                .overlay {
                                                    Text((viewModel.currentUser?.fullname ?? "").prefix(1).uppercased())
                                                        .foregroundStyle(.white)
                                                        .font(.system(size: 15))
                                                }
                                        }

    //                                    Image("photo")
    //                                        .resizable()
    //                                        .frame(width: 35, height: 35)
    //                                        .cornerRadius(17.5)
                                    }

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

                            HStack {
                                VStack {
                                    Image(systemName: "circle")
                                        .font(.system(size: 80))
                                    Text("Post a late BeReal.")
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(.white)
                                .padding(.bottom, 12)
                                .onTapGesture {
                                    cameraViewPresented.toggle()
                                }
                            }
                        }
                    }
            }
            .onAppear {
                KingfisherManager.shared.cache.clearMemoryCache()
            }
        }
        .fullScreenCover(isPresented: $cameraViewPresented) {

        } content: {
            CameraView(viewModel: CameraViewModel(user: AuthenticationViewModel.shared.currentUser!))
        }
    }
}

//#Preview {
//    FeedView(mainMenu: .constant(.feed))
//}
