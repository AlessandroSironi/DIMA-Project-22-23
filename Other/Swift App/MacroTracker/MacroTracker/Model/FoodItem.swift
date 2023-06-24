//
//  FoodItem.swift
//  MacroTracker
//
//  Created by Tommaso Sprocati on 28/03/23.
//

import Foundation

class FoodItem: Identifiable{
    let name: String
    let barcode: String
    let brand: String
    let kcal: Float
    let carbs: Float
    let proteins: Float
    let fats: Float
    
    init() {
        self.name = ""
        self.barcode = ""
        self.brand = ""
        self.kcal = 0.0
        self.carbs = 0.0
        self.proteins = 0.0
        self.fats = 0.0
    }
    
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
