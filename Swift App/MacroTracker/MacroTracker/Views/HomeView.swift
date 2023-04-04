//
//  HomeView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 29/03/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "calendar")
                }
            GoalView()
                .tabItem {
                    Label("Goal", systemImage: "trophy")
                }
            AddView()
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            DietView()
                .tabItem {
                    Label("Diet", systemImage: "fork.knife")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "person")
                }
        }    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
