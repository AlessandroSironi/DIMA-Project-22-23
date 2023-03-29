//
//  ContentView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 20/03/23.
//
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var userIsLoggedIn = false
    var body: some View {
        if (userIsLoggedIn) {
            HomeView()
        } else {
            AuthView()
        }
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

