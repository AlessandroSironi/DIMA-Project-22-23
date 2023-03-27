//
//  TodayView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import Charts
import SwiftUICharts // External plugin: https://github.com/AppPear/ChartView/


struct DailyNutrition: Identifiable {
    let id = UUID()
    let day: String
    let energy: Int
    let carbohydrates: Float
    let fats: Float
    let proteins: Float
}
extension DailyNutrition {
    static let weekSituation: [DailyNutrition] = [
        .init(day: "Mon", energy: 1800, carbohydrates: 200, fats: 300, proteins: 400),
        .init(day: "Tue", energy: 2000, carbohydrates: 320, fats: 310, proteins: 410),
        .init(day: "Wed", energy: 2200, carbohydrates: 360, fats: 380, proteins: 390),
        .init(day: "Thu", energy: 1700, carbohydrates: 280, fats: 390, proteins: 380),
        .init(day: "Fri", energy: 1800, carbohydrates: 340, fats: 340, proteins: 420),
        .init(day: "Sat", energy: 1600, carbohydrates: 290, fats: 220, proteins: 400),
        .init(day: "Sun", energy: 2200, carbohydrates: 300, fats: 280, proteins: 410)
    ]
}


struct TodayView: View {
    
    @ObservedObject private var environment = EnvironmentSingleton.shared
    @State var progressNutriments: NutritionFacts = NutritionFacts()
    @State private var week = DailyNutrition.weekSituation
    
    func updateNutriments() {
        if environment.getIsAuthenticated() {
            // Calculate daily total consumed nutriments
            let dailyTotalNutritionFacts: NutritionFacts = environment.user!.situation.getDailyConsumedNutriments()
            
            // Calculate daily progress
            self.progressNutriments = dailyTotalNutritionFacts.multiply(k: 1/500) // Suppose goal=500 for each nutriment
            
            // Serialize and print UserModel
            self.environment.serializeUser()
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            // If the user is not authenticated, show login button <-- example, to be replaced
            if(!environment.getIsAuthenticated()) {
                Text("User not authenticated, please sign in.")
                Text("---")
                Button(action: {
                    //TODO: remove stub
                    
                    // ...
                    // Authentication part is missing
                    // ...
                    
                    environment.setIsAuthenticated (value: true)
                    
                    // Creating simple empty user for test. Should instead be retrieved from memory after authentication
                    environment.user = UserModel(
                        name: "Mario",
                        surname: "Rossi",
                        situation: UserSituation(
                            consumedFoodItems: Dictionary<UUID, FoodItem>(),
                            consumedFoodAssumptions: [FoodAssumption](),
                            targets: [NutritionFactsTarget]()
                        ),
                        uid: "12345678"
                    )
                    
                    // User is now authenticated, let's add some test food assumptions
                    let foodItem = FoodItem(
                        name: "Pasta al pesto",
                        nutrients: NutritionFacts(
                            energy: Measurement(
                                value: 800,
                                unit: UnitEnergy.kilocalories
                            ),
                            proteins: Measurement(
                                value: 40,
                                unit: UnitMass.grams
                            ),
                            fats: Measurement(
                                value: 50,
                                unit: UnitMass.grams
                            ),
                            carbohydrates: Measurement(
                                value: 40,
                                unit: UnitMass.grams
                            ),
                            fibers: Measurement(
                                value: 2,
                                unit: UnitMass.grams
                            )
                        )
                    )
                    environment.user!.situation.addAssumption(
                        foodItem: foodItem,
                        quantity: Measurement(value: 80, unit: UnitMass.grams),
                        date: Date()
                    )
                    environment.user!.situation.addAssumption(
                        foodItem: foodItem,
                        quantity: Measurement(value: 10, unit: UnitMass.grams),
                        date: Date()
                    )
                    
                    self.updateNutriments()
                    
                }) {
                    Text("Simulate authentication")
                }
                .buttonStyle(.borderedProminent)
            } else {
                Text("User successfully authenticated.")
                    .foregroundColor(.green)
                    .bold()
                //Text("Welcome, \(environment.user!.getUID())!")
                Button(action: {
                    environment.setIsAuthenticated (value: false)
                    environment.user = nil
                    self.progressNutriments = NutritionFacts()
                }) {
                    Text("Logout")
                }
                .buttonStyle(.bordered)
            }
            
            /*
            Section {
                RingsChart()
                    .data(demoData)
                    .chartStyle(
                        ChartStyle(
                            backgroundColor: .white,
                            foregroundColor: ColorGradient(.blue, .purple)
                        )
                    )
            }
            */
            
            Section {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(
                            colors: [Color("Color1"), Color("Color2")],
                            startPoint: .init(x: 0, y: 0),
                            endPoint: .init(x: 0.1, y: 1)
                        ))
                        .opacity(0.2)
                        .frame(height: 230)
                    VStack {
                        Text("Nutriments")
                            .font(.title3)
                            //.foregroundColor(.black)
                            .bold()
                            .padding(.bottom)
                        HStack {
                            VStack {
                                Text("C")
                                    .bold()
                                ProgressBar(progress: self.$progressNutriments.carbohydrates.value, color: Color.blue)
                                    .padding()
                            }
                            VStack {
                                Text("F")
                                    .bold()
                                ProgressBar(progress: self.$progressNutriments.fats.value, color: Color.green)
                                    .padding()
                            }
                            VStack {
                                Text("P")
                                    .bold()
                                ProgressBar(progress: self.$progressNutriments.proteins.value, color: Color.orange)
                                    .padding()
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                }
            }
            .padding()
            
            Section {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(
                            //colors: [.purple, .orange],
                            colors: [Color("Color1"), Color("Color2")],
                            startPoint: .init(x: 0, y: 0.5),
                            endPoint: .init(x: 0.5, y: 1)
                        ))
                        .opacity(0.2)
                    VStack {
                        Text("Energy")
                            .font(.title3)
                            //.foregroundColor(.black)
                            .bold()
                            .padding()
                        HStack {
                            Chart {
                                ForEach(week) { w in
                                    LineMark(
                                        x: .value("Day", w.day),
                                        y: .value("Mins", w.energy)
                                    )
                                    .lineStyle(.init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                }
                                .interpolationMethod(.catmullRom)
                                //.foregroundStyle(Gradient(colors: [.yellow, .orange, .pink]))
                                .foregroundStyle(Gradient(colors: [Color("Color1"), Color("Color2")]))
                            }
                            .chartYScale(domain: 1500...2400)
                            .padding()
                        }
                    }
                }
            }
            .padding()
            
            .task {
                self.updateNutriments()
            }
            
            .navigationTitle("Today")
            Spacer()
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
