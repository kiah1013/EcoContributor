//
//  EcoContributorAppApp.swift
//  EcoContributorApp
//
//  Created by Kiah Epperson on 11/14/24.
//

import SwiftUI
import AuthenticationServices
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class UserAuth: ObservableObject {
    @Published var isLogged: Bool = false
    @Published var userId: String? = nil
    @Published var isGuest: Bool = false
}

@main

struct EcoContributorAppApp: App {
    @StateObject var userAuth = UserAuth()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("isDarkMode") private var isDarkMode = false


    var body: some Scene {
        WindowGroup {
            if userAuth.isLogged {
                HomepageView().environmentObject(userAuth).preferredColorScheme(isDarkMode ? .dark : .light)
            } else if userAuth.isGuest {
                HomepageView().environmentObject(userAuth).preferredColorScheme(isDarkMode ? .dark : .light)
            } else {
                LoginView().environmentObject(userAuth).preferredColorScheme(isDarkMode ? .dark : .light)
            }
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
