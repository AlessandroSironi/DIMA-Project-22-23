//
//  AuthView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI

struct AuthView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            Text("")
                .bold()
                .navigationTitle("MacroTracker")
            Spacer()
            Text("Content Filler")
            Spacer()
            
            NavigationLink() {
                SignInScreenView()
            } label: {
                PrimaryButton(title: "Login")
            }
            
            NavigationLink() {
                SignUpScreenView()
            } label: {
                SecondaryButton(title: "SignUp")
            }
        }
    }
      
      
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
