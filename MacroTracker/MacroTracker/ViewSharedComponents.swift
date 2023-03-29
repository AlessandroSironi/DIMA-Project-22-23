//
//  ViewSharedComponents.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 21/03/23.
//

import Foundation
import SwiftUI


// Used in TodayView
struct ProgressBar: View {
    @Binding var progress: Double
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(color)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
                //.animation(.linear)

            Text(String(format: "%.0f%%", min(self.progress, 1.0)*100.0))
                .font(.headline)
                .foregroundColor(Color.gray)
                .bold()
        }
    }
}


// Used in AddView
struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .font(.title)
                .padding(.bottom, 10)
            configuration.title
        }
    }
}


// Used in DietView
struct FoodItemListRow: View {
    var foodItem: FoodItem
    
    var body: some View {
        
        HStack {
            ZStack {
                Circle()
                    .fill(.orange)
                    .opacity(0.2)
                    .frame(height: 50)
                Text("🥗")
                    .font(.title)
            }
            VStack {
                HStack {
                    Text(foodItem.name)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("Energy: " + String(format: "%.0f ", foodItem.kcal) + " kcal")
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
        
    }
}

