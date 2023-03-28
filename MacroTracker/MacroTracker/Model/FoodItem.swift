//
//  FoodItem.swift
//  MacroTracker
//
//  Created by Tommaso Sprocati on 28/03/23.
//

import Foundation

class FoodItem {
    let name: String
    let barcode: String
    let brand: String
    let kcal: Float
    let carbs: Float
    let proteins: Float
    let fats: Float
    
    init(name: String, barcode: String, brand: String, kcal: Float, carbs: Float, proteins: Float, fats: Float) {
        self.name = name
        self.barcode = barcode
        self.brand = brand
        self.kcal = kcal
        self.carbs = carbs
        self.proteins = proteins
        self.fats = fats
    }
}
