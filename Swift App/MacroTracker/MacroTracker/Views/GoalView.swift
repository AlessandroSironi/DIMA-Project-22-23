//
//  GoalView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import SwiftUICharts // External plugin: https://github.com/AppPear/ChartView/
import Charts

struct GoalView: View {
    @State var kcalGoal = 2000
    @State var carbsGoal = 200
    @State var proteinsGoal = 200
    @State var fatsGoal = 100
    var body: some View {
        VStack {
            VStack{
                Text("Set your KCal Goal")
                
                HStack{
                    Button {
                        kcalGoal -= 50
                    } label: {
                        Image(systemName: "minus.circle")
                    }
                    
                    TextField("kcal Goal", value: $kcalGoal, formatter: NumberFormatter())
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .frame(minWidth: 15, maxWidth: 60)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.all)
                    
                    Button {
                        kcalGoal += 50
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
                
            }
            //TODO: update on database.
            HStack {
                Stepper("kcal Goal", onIncrement: { kcalGoal += 10 }, onDecrement: { kcalGoal -= 10 })
                    .padding(.all)
                TextField("kcal Goal", value: $kcalGoal, formatter: NumberFormatter())
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                    .frame(minWidth: 15, maxWidth: 60)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all)
            }
            Stepper("Carbs Goal: \(carbsGoal) ", onIncrement: { carbsGoal += 10 }, onDecrement: { carbsGoal -= 10 })
            .padding(.all)
            Stepper("Proteins Goal: \(proteinsGoal) ", onIncrement: { proteinsGoal += 10 }, onDecrement: { proteinsGoal -= 10 })
            .padding(.all)
            Stepper("Fats Goal: \(fatsGoal) ", onIncrement: { fatsGoal += 10 }, onDecrement: { fatsGoal -= 10 })
            .padding(.all)
            
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}

