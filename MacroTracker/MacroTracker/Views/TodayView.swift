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
    /*
     static let weekSituation: [DailyNutrition] = [
        .init(day: "Mon", energy: 1800, carbohydrates: 200, fats: 300, proteins: 400),
        .init(day: "Tue", energy: 2000, carbohydrates: 320, fats: 310, proteins: 410),
        .init(day: "Wed", energy: 2200, carbohydrates: 360, fats: 380, proteins: 390),
        .init(day: "Thu", energy: 1700, carbohydrates: 280, fats: 390, proteins: 380),
        .init(day: "Fri", energy: 1800, carbohydrates: 340, fats: 340, proteins: 420),
        .init(day: "Sat", energy: 1600, carbohydrates: 290, fats: 220, proteins: 400),
        .init(day: "Sun", energy: 2200, carbohydrates: 300, fats: 280, proteins: 410)
    ]
     */
}


struct TodayView: View {
    
    
    var body: some View {
        Text("Hello world")
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
