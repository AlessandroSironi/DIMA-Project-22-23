//
//  MacroTrackerApp.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 20/03/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
          if (Auth.auth().currentUser?.uid == nil) {
              AuthView()
          } else {
              ContentView()
          }
      }
    }
  }
}
