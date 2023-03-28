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
    
    var body: some View {
        
        NavigationStack {
            Text("")
                .bold()
                .navigationTitle("Goal")
            
            List {
                NavigationStack {
                    HStack{
                        Text("Weight")
                        Spacer()
                        Text("70kg").foregroundColor(Color.gray)
                        
                    }
                }
                
                NavigationStack {
                    HStack {
                        Text("Calories")
                        Spacer()
                        Text("2000kcal").foregroundColor(Color.gray)
                    }
                }
                
                NavigationStack {
                    HStack{
                        Text("Carbs")
                        Spacer()
                        Text("200g").foregroundColor(Color.gray)
                    }
                }
                
                NavigationStack {
                    HStack{
                        Text("Proteins")
                        Spacer()
                        Text("200g").foregroundColor(Color.gray)
                    }
                }
                
                NavigationStack {
                    HStack{
                        Text("Fats")
                        Spacer()
                        Text("70g").foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}

