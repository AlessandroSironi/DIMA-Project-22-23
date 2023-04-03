//
//  SettingsView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    var body: some View {
        @State var userIsLoggingOut = false
        if (userIsLoggingOut) {
            AuthView()
        } else {
            NavigationStack {
                List {
                    //TODO: These will be Navigation Links?!
                    Text("Account")
                    Text("Notifications")
                    Text("Appearance")
                    Text("Credits")
                    Button() {
                        do {
                            try Auth.auth().signOut()
                            print("User LOGGED OUT")
                        } catch {
                            print("Error signing out user...")
                        }
                        userIsLoggingOut = true
                    } label:
                    {
                        Text("Logout")
                    }
                }.navigationTitle("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

