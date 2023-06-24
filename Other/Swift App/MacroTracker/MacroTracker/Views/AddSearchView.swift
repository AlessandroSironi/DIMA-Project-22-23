//
//  AddSearchView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//
import SwiftUI

struct AddSearchView: View {
    
    @State private var productName: String = ""
    @State private var productManufacturer: String = ""
    @State private var productCode: String = ""
    
    @State var proceed = false
    
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section {
                    TextField("Prodotto", text: $productName)
                    TextField("Marca", text: $productManufacturer)
                    TextField("Codice", text: $productCode)
                }
                Button("Cerca") {
                    proceed = true
                }
            }

            .navigationTitle("Search")
            .sheet(isPresented: $proceed) {
                AddRetrieveView(productCode: productCode).interactiveDismissDisabled(true)
            }
        }
        
    }
}

struct AddSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AddSearchView()
    }
}
