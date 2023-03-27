//
//  DietView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI


struct DietView: View {
    
    @ObservedObject private var environment = EnvironmentSingleton.shared
    @State private var foodItemsList: [FoodItem] = []
    
    var body: some View {
        
        NavigationStack {
            
            Section {
                
                if self.environment.getIsAuthenticated() {
                    
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Picker")) {
                        Text("Alimenti").tag(1)
                        Text("Combinazioni").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    List(self.foodItemsList) { foodItem in
                        FoodItemListRow(foodItem: foodItem)
                    }
                    .listStyle(.inset)
                    
                } else {
                    Text("Nothing to show. User not authenticated.")
                }
                
            }
            
            .task {
                if self.environment.getIsAuthenticated() {
                    self.foodItemsList = self.environment.user!.situation.foodItemsList
                }
            }
            
            .navigationTitle("Diet")
            Spacer()
                
                /*
                List() {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.quaternary)
                                .frame(height: 50)
                            Text("🍝")
                                .font(.title)
                        }
                        VStack {
                            HStack {
                                Text("Pasta al pesto")
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text("Energy: 1000 kcal")
                                    .font(.caption)
                                    .textCase(.uppercase)
                                Spacer()
                            }
                        }
                        .padding(.leading)
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.quaternary)
                                .frame(height: 50)
                            Text("🍕")
                                .font(.title)
                        }
                        VStack {
                            HStack {
                                Text("Pizza margherita")
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text("Energy: 1000 kcal")
                                    .font(.caption)
                                    .textCase(.uppercase)
                                Spacer()
                            }
                        }
                        .padding(.leading)
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 1.0, green: 0.8, blue: 0.5, opacity: 1.0))
                                .frame(height: 50)
                            Text("🥗")
                                .font(.title)
                        }
                        VStack {
                            HStack {
                                Text("Insalata")
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text("Energy: 1000 kcal")
                                    .font(.caption)
                                    .textCase(.uppercase)
                                Spacer()
                            }
                        }
                        .padding(.leading)
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(red: 0.8, green: 0.5, blue: 1.0, opacity: 1.0))
                                .frame(height: 50)
                            Text("🍪")
                                .font(.title)
                        }
                        VStack {
                            HStack {
                                Text("Biscotto")
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text("BISCOTTI S.R.L.")
                                    .font(.caption)
                                    .textCase(.uppercase)
                                Spacer()
                            }
                            HStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.blue)
                                    .frame(width: 80, height: 6)
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.orange)
                                    .frame(width: 60, height: 6)
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.green)
                                    .frame(width: 40, height: 6)
                                Spacer()
                            }
                        }
                        .padding(.leading)
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.quaternary)
                                .frame(height: 50)
                            Text("🥑")
                                .font(.title)
                        }
                        VStack {
                            HStack {
                                Text("Avocado")
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            .padding(.bottom, 2)
                            HStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.blue)
                                    .frame(width: 20, height: 6)
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.orange)
                                    .frame(width: 90, height: 6)
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.green)
                                    .frame(width: 30, height: 6)
                                Spacer()
                            }
                        }
                        .padding(.leading)
                    }
                    
                }
                */
                
            
        }
        
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
