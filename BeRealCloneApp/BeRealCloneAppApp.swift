//
//  BeRealCloneAppApp.swift
//  BeRealCloneApp
//
//  Created by Игорь Никифоров on 08.10.2024.
//

import SwiftUI
import FirebaseCore

@main
struct BeRealCloneAppApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some Scene {
        WindowGroup {
            //CameraView(viewModel: CameraViewModel(user: AuthenticationViewModel.shared.currentUser!))
            MainView().environmentObject(AuthenticationViewModel.shared)
        }
    }
}

// Firebase initialization
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        .noData
    }
}
