//
//  AddView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI

struct AddView: View {
    /*
    let names = [
        "Pasta della marca A",
        "Pasta della marca B",
        "Pasta della marca C",
        "Pasta della marca D",
        "Pollo",
        "Insalata",
        "Riso"
    ]
     */
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            
            /*
            Text("Prova a cercare 'Pasta' o 'Riso'.")
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }
            }
            .searchable(text: $searchText)
            */
            
            VStack() {
                
                HStack() {
                    NavigationLink(
                        destination: AddScanView()
                    ) {
                        VStack() {
                            Label("Scansiona codice prodotto", systemImage: "barcode.viewfinder")
                                .labelStyle(VerticalLabelStyle())
                                .frame(maxWidth: .infinity, minHeight: 150)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: AddSearchView()
                    ) {
                        VStack() {
                            Label("Ricerca prodotto manualmente", systemImage: "magnifyingglass")
                                .labelStyle(VerticalLabelStyle())
                                .frame(maxWidth: .infinity, minHeight: 150)
                        }
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
                
                HStack() {
                    NavigationLink(
                        destination: AddCreateView()
                    ) {
                        VStack() {
                            Label("Crea alimento personalizzato", systemImage: "square.and.pencil")
                                .labelStyle(VerticalLabelStyle())
                                .frame(maxWidth: .infinity, minHeight: 150)
                        }
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        VStack() {
                            Label("Inserisci dalla tua dieta", systemImage: "takeoutbag.and.cup.and.straw")
                                .labelStyle(VerticalLabelStyle())
                                .frame(maxWidth: .infinity, minHeight: 150)
                        }
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
                
            }
            .padding()
            
            /*
            
            Section {
                HStack() {
                    Text("Potresti voler inserire:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                List() {
                    HStack() {
                        Text("Riso con pollo")
                        Spacer()
                        Text("Ricetta")
                            .padding()
                            .frame(height: 20)
                            .background(Rectangle().fill(Color.orange).cornerRadius(10))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                            .font(.caption)
                    }
                    HStack() {
                        Text("Pasta al pesto")
                        Spacer()
                        Text("Ricetta")
                            .padding()
                            .frame(height: 20)
                            .background(Rectangle().fill(Color.orange).cornerRadius(10))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                            .font(.caption)
                    }
                    HStack() {
                        Text("Insalata")
                        Spacer()
                        Text("Alimento")
                            .padding()
                            .frame(height: 20)
                            .background(Rectangle().fill(Color.blue).cornerRadius(10))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                            .font(.caption)
                    }
                }
                .listStyle(.inset)
            }
            */
            
            Grid {
                GridRow {
                    Text("Row 1")
                    ForEach(0..<2) { _ in Color.red }
                }
                GridRow {
                    Text("Row 2")
                    ForEach(0..<3) { _ in Color.green }
                }
                GridRow {
                    Text("Row 3")
                    ForEach(0..<4) { _ in Color.blue }
                }
            }
            .padding()
            
            .navigationTitle("Add")
        }
        
    }
    
    /*
    var searchResults: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
     */
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
