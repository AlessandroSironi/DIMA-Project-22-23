//
//  AddRetrieveView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import Combine // In order to use Just in numeric field sanitization

struct AddRetrieveView: View {
    @Environment(\.dismiss) var dismiss
    
    // Product to be retrieved
    var productCode: String
    
    // Default quantity
    @State var quantity: String = "100"
    
    // Form: Nutriments
    @State private var formProductNutrimentsEnergy: String = ""
    @State private var formProductNutrimentsCarbohydrates: String = ""
    @State private var formProductNutrimentsFat: String = ""
    @State private var formProductNutrimentsProtein: String = ""

    // Font: Assumption
    @State private var formProductAssumptionQuantity: String = "100"
    @State private var formProductAssumptionDate: Date = Date()
    
    @State var foodItem: FoodItem = FoodItem()
        
    init(productCode: String) {
        self.productCode = productCode
    }
        
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section(header: Text("Product")) {
                    HStack {
                        Text("Name").frame(width: 100, alignment: .leading)
                        Spacer()
                        Text(foodItem.name)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Brand").frame(width: 100, alignment: .leading)
                        Spacer()
                        Text(foodItem.brand)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Barcode").frame(width: 100, alignment: .leading)
                        Spacer()
                        Text(foodItem.barcode)
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("Nutrition Facts - 100g")) {
                    HStack {
                        Text("⚡ Energy (kcal)")
                        Spacer()
                        TextField("100.0", text: $formProductNutrimentsEnergy)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onReceive(Just(formProductNutrimentsEnergy)) { newValue in
                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                if filtered != newValue {
                                    self.formProductNutrimentsEnergy = filtered
                                }
                            }
                    }
                    HStack {
                        Text("🍞 Carbos (g)")
                        Spacer()
                        TextField("100.0", text: $formProductNutrimentsCarbohydrates)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onReceive(Just(formProductNutrimentsCarbohydrates)) { newValue in
                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                if filtered != newValue {
                                    self.formProductNutrimentsCarbohydrates = filtered
                                }
                            }
                    }
                    HStack {
                        Text("🥩 Protein (g)")
                        Spacer()
                        TextField("100.0", text: $formProductNutrimentsProtein)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onReceive(Just(formProductNutrimentsProtein)) { newValue in
                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                if filtered != newValue {
                                    self.formProductNutrimentsProtein = filtered
                                }
                            }
                    }
                    HStack {
                        Text("🥑 Fat (g)")
                        Spacer()
                        TextField("100.0", text: $formProductNutrimentsFat)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onReceive(Just(formProductNutrimentsFat)) { newValue in
                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                if filtered != newValue {
                                    self.formProductNutrimentsFat = filtered
                                }
                            }
                    }
                }
                
                Section(header: Text("Assumption")) {
                    HStack {
                        Text("Quantity (g)")
                        Spacer()
                        TextField("100.0", text: $formProductAssumptionQuantity)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onReceive(Just(formProductAssumptionQuantity)) { newValue in
                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                if filtered != newValue {
                                    self.formProductAssumptionQuantity = filtered
                                }
                            }
                    }
                    HStack {
                        Text("Datetime")
                        Spacer()
                        /*
                        DatePicker(
                            selection: $formProductAssumptionDate,
                            in: ...Date(),
                            displayedComponents: [.date, .hourAndMinute]
                        ) {}
                        */
                    }
                }
                
                Button(action: {
                    //TODO: adding to firestore the product
                    
                    dismiss()
                }) {
                    Text("Insert product")
                        .bold()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .destructiveAction) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
            
            .task {
                if let foodItem = await OpenFoodFactsAPI().getProduct(id: productCode) {
                    
                    self.foodItem = foodItem
                    
                    self.formProductNutrimentsEnergy = String(format: "%.0f", self.foodItem.kcal)
                    self.formProductNutrimentsCarbohydrates = String(format: "%.2f", self.foodItem.carbs)
                    self.formProductNutrimentsFat = String(format: "%.2f", self.foodItem.proteins)
                    self.formProductNutrimentsProtein = String(format: "%.2f", self.foodItem.fats)
                    
                } else {
                    dismiss()
                }
            }
            
        }
        
    }
}

struct AddRetrieveView_Previews: PreviewProvider {
    static var previews: some View {
        AddRetrieveView(productCode: "3017620422003")
    }
}
