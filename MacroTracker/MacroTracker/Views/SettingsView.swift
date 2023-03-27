//
//  SettingsView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationStack {
            List {
                Text("Account")
                Text("Notifications")
                Text("Appearance")
                Text("Credits")
            }
            .navigationTitle("Settings")
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

