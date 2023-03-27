//
//  AuthView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

struct AuthView: View {
    //@ObservedObject private var environment = EnvironmentSingleton.shared
    //@State private var isLogin = false
    @State var email = ""
    @State var password = ""
    @State private var didFail = false
    
    var ref: DatabaseReference = Database.database().reference()
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            Text("")
                .bold()
                .navigationTitle("MacroCounter")
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
      
      private func createUser() {
          Auth.auth().createUser(withEmail: email, password: password, completion: { result, err in
              if let err = err {
                  print("Failed due to error:", err)
                  //TODO: Show error
                  return
              }
              print("Successfully created account with ID: \(result?.user.uid ?? "")")
              environment.setIsAuthenticated (value: true)
              environment.user = UserModel (
                //TODO: retrieve actual data from database
                name: "Mario",
                surname: "Rossi",
                situation: UserSituation(
                    consumedFoodItems: Dictionary<UUID, FoodItem>(),
                    consumedFoodAssumptions: [FoodAssumption](),
                    targets: [NutritionFactsTarget]()
                ),
                uid: result?.user.uid ?? ""
              )
          })
          //Database
          self.ref.child("users").child(environment.user?.getUID() ?? "0").setValue(["email": email, "name": environment.user?.getName(), "surname": environment.user?.getSurname()])
          
          self.ref.child("users").setValue(["porcodio"])
      }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
