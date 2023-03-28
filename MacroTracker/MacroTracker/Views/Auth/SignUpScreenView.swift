//
//  SignUpScreenView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpScreenView: View {
    let db = Firestore.firestore()
    
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var surname = ""
    @State var errorMsg = ""
    var body: some View {
        NavigationView() {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("")
                        .font(.title)
                        .bold()
                        .navigationTitle("Sign Up")
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
                    TextField("Name", text: $name)
                        .disableAutocorrection(true)
                        .autocapitalization(.words)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 280, height: 45, alignment: .center)
                    TextField("Surname", text: $surname)
                        .disableAutocorrection(true)
                        .autocapitalization(.words)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 280, height: 45, alignment: .center)
                    Text(errorMsg)
                    Button(action: {
                        createUser()
                    }, label: {
                        PrimaryButton(title: "Sign Up")
                    }).padding(.horizontal)
                    Spacer()
                }
            }
        }
    }
    
    private func createUser() {
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, err in
            if let err = err {
                print("Failed due to error:", err)
                //TODO: Show error
                return
            }
            print("Successfully created account with ID: \(result?.user.uid ?? "")")
            
            db.collection("users").document(result?.user.uid ?? "").setData([
              "name" : name,
              "surname" : surname,
              "coffee_assumption" : [],
              "water_assumption" : [],
              "favourites" : [],
              "foods" : [],
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                }
            }
        })
    }
}

struct SignUpScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreenView()
    }
}
