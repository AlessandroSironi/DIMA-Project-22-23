//
//  SignInScreenView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import FirebaseAuth

struct SignInScreenView: View {
    @State var email = ""
    @State var password = ""
    @State var errorMsg = ""
    var body: some View {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("")
                        .navigationTitle("Log In")
                    Spacer()
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 280, height: 45, alignment: .center)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 280, height: 45, alignment: .center)
                    Text("Forgot Password?")
                    /*
                    Button() {
                        loginUser()
                    } label:
                    {
                        NavigationLink(destination: ContentView()) {
                            PrimaryButton(title: "Sign In")
                        }
                    }.padding(.horizontal)
                     */
                    
                    Button() {
                        loginUser()
                    } label: {
                        PrimaryButton(title: "Sign In")
                            .padding(.horizontal)
                    }
                    Spacer()
                }
            }
    }
    
    struct SignInScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SignInScreenView()
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed due to error:", err)
                self.errorMsg = "Failed to login user: \(err)"
                return
            }
            print("Successfully logged in with ID: \(result?.user.uid ?? "")")
        }
    }
}
