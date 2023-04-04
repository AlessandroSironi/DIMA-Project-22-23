//
//  AddCreateView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI

struct AddCreateView: View {
    
    @State private var isProduct: Bool = true
    @State private var productName: String = ""
    @State private var productManufacturer: String = ""
    @State private var productCode: String = ""
    
    @State private var energy: String = ""
    @State private var fats: String = ""
    @State private var carbos: String = ""
    @State private var proteins: String = ""
    
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section {
                    TextField("Alimento", text: $productName)
                    Toggle("È un prodotto commerciale?", isOn: $isProduct)
                }
                Section {
                    TextField("Marca", text: $productManufacturer)
                    TextField("Codice", text: $productCode)
                }
                Section {
                    Text("Valori nutrizionali per 100g:")
                    TextField("Energia [kcal]", text: $energy)
                    TextField("Grassi [g]", text: $fats)
                    TextField("Carboidrati [g]", text: $carbos)
                    TextField("Proteine [g]", text: $proteins)
                }
                Button("Cerca") {}
            }

            .navigationTitle("Salva")
        }
        
    }
    
}

struct AddCreateView_Previews: PreviewProvider {
    static var previews: some View {
        AddCreateView()
    }
}
