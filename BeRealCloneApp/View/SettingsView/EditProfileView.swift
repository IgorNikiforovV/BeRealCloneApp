//
//  EditProfileView.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 24.10.2024.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @State var width = UIScreen.main.bounds.width

    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dissmiss

    @State var fullname: String
    @State var username: String
    @State var bio: String
    @State var location: String

    @State var imagePickerPresented = false

    @State private var selectedIamge: UIImage?
    @State var profileImage: Image?

    let currentUser: User

    init(currentUser: User) {
        self.currentUser = currentUser
        self._fullname = State(initialValue: currentUser.fullname)
        self._bio = State(initialValue: currentUser.bio ?? "")
        self._username = State(initialValue: currentUser.username ?? "")
        self._location = State(initialValue: currentUser.location ?? "")
    }

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ZStack {
                        HStack {
                            Button {
                                dissmiss()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(.white)
                            }

                            Spacer()

                            Button {
                                Task {
                                    await saveData()
                                }
                                dissmiss()
                            } label: {
                                Text("Save")
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding(.horizontal, width * 0.05)
                        Text("Edit Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }

                    ZStack {
                        HStack {
                            Spacer()
                            Rectangle()
                                .frame(width: width * 0.95, height: 0.7)
                                .foregroundColor(.gray)
                                .opacity(0.5)
                        }
                    }
                    Spacer()
                }
                
                VStack {
                    Button {
                        self.imagePickerPresented.toggle()
                    } label: {
                        ZStack(alignment: .bottomTrailing) {
    //                        Image("photo")
    //                            .resizable()
    //                            .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
    //                            .frame(width: 120, height: 120)
    //                            .cornerRadius(60)
                            if let image = profileImage {
                                image
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(60)
                            } else if let image = viewModel.currentUser?.profileImageUrl,
                               profileImage == nil {
                                ZStack {
                                    Circle()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(60)
                                        .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                        .overlay {
                                            Text((viewModel.currentUser?.fullname ?? "").prefix(1))
                                                .foregroundStyle(.white)
                                                .font(.system(size: 55))
                                        }
                                    KFImage(URL(string: image))
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(60)
                                }
                            } else {
                                Circle()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(60)
                                    .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                    .overlay {
                                        Text((viewModel.currentUser?.fullname ?? "").prefix(1))
                                            .foregroundStyle(.white)
                                            .font(.system(size: 55))
                                    }
                            }

                            ZStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 34, height: 34)
                                        .foregroundColor(.black)
                                    Circle()
                                        .frame(width: 30 , height: 30)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 30 , height: 30)
                                        .foregroundColor(.black)
                                        .opacity(0.1)
                                }
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                            }
                        }
                    }
                    .sheet(isPresented: $imagePickerPresented) {
                        loadImage()
                    } content: {
                        ImagePicker(image: $selectedIamge)
                    }

                    // MENU
                    VStack {
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)

                        HStack {
                            HStack {
                                Text(viewModel.currentUser?.fullname ?? "")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $fullname)
                                    .font(.system(size: 16))
                                    .paceholder(when: fullname.isEmpty) {
                                        Text("Igor").foregroundStyle(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)

                        HStack {
                            HStack {
                                Text("Username")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $username)
                                    .font(.system(size: 16))
                                    .paceholder(when: username.isEmpty) {
                                        Text("Niki").foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)

                        HStack(alignment: .top) {
                            HStack {
                                Text("Bio")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .padding(.leading, -4)
                            .frame(width: width * 0.2)

                            //if #available(ios 16, *) {
                            TextEditor(text: $bio)
                                .foregroundColor(.white)
                                .background(.clear)
                                .scrollContentBackground(.hidden)
                                .frame(height: 100)
                                .padding(.leading, width * 0.05)
                                .overlay (
                                    VStack {
                                        HStack {
                                            if bio.isEmpty {
                                                Text("Bio")
                                                    .foregroundStyle(.gray)
                                                    .font(.system(size: 16))
                                                    .zIndex(1)
                                                    .padding(.top, 8)
                                                    .padding(.leading, 24)
                                            }
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                )
                                .padding(.top, -8)
                                .frame(width: width * 0.63)
                            //}
                        }

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)

                        HStack {
                            HStack {
                                Text("Location")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $location)
                                    .font(.system(size: 16))
                                    .paceholder(when: username.isEmpty) {
                                        if location.isEmpty {
                                            Text("Location").foregroundStyle(.gray)
                                                .font(.system(size: 16))
                                        }
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)
                    Spacer()
                }
                .padding(.top, UIScreen.main.bounds.height * 0.08)
            }
        }
    }

    func saveData() async {
        guard let user = viewModel.currentUser else { return }
        if user.fullname != self.fullname && !self.fullname.isEmpty {
            viewModel.currentUser?.fullname = self.fullname
            await viewModel.saveUserData(data: ["fullname": self.fullname])
        }
        if user.username != self.username && !self.username.isEmpty {
            viewModel.currentUser?.username = self.username
            await viewModel.saveUserData(data: ["username": self.username])
        }
        if user.bio != self.bio && !self.bio.isEmpty {
            viewModel.currentUser?.bio = self.bio
            await viewModel.saveUserData(data: ["bio": self.bio])
        }
        if user.location != self.location && !self.location.isEmpty {
            viewModel.currentUser?.location = self.location
            await viewModel.saveUserData(data: ["location": self.location])
        }

        if let image = selectedIamge {
            viewModel.uploadProfileImage(image: image) { url in
                do {
                    Task {
                        viewModel.currentUser?.profileImageUrl = url
                        await viewModel.saveUserData(data: ["profileImageUrl": url])
                    }

                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func loadImage() {
        guard let selectedIamge else { return }
        profileImage = Image(uiImage: selectedIamge)
    }
}

#Preview {
    EditProfileView(currentUser: User(
        id: "123456",
        username: "Igor",
        profileImageUrl: nil,
        fullname: "Igor Niki",
        date: "09.10.1985",
        bio: "XXX",
        location: "Moscow",
        phone: "+79195656653"
    ) )
}
