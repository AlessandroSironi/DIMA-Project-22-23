//
//  ContentView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 20/03/23.
//
import SwiftUI

struct ContentView: View {
    
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
        }
        //.accentColor(.green)
        //.tint(.green)
    }
    
}

struct PrimaryButton: View {
    var title: String
    var body: some View {
        Button {
        } label: {
          Text(title)
          .font(.title2)
          .bold()
          .foregroundColor(.white)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(
           LinearGradient(colors: [Color("Color1"), Color("Color2")],                   startPoint: .topLeading,                   endPoint: .bottomTrailing) // how to add a gradient to a button in SwiftUI
        )
        .cornerRadius(20)
        .padding()
    }
}

struct SecondaryButton: View {
    var title: String
    var body: some View {
        Button {
        } label: {
          Text(title)
          .font(.title2)
          .bold()
          .foregroundColor(.white)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(
            Color("Color1")
        )
        .cornerRadius(20)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

