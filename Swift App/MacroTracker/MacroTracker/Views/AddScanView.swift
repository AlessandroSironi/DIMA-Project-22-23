//
//  AddScanView.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import SwiftUI
import PopupView
import CarBode

struct AddScanView: View {
    
    @State var barcodeFound = false
    @State var productCode = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                HStack {
                    Text("Per procedere inquadra il codice a barre del prodotto che vuoi inserire.")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                ZStack {
                    CBScanner(
                        supportBarcode: .constant([.code128, .code39, .code39Mod43, .code93, .ean8, .ean13]), //Set type of barcode you want to scan
                        scanInterval: .constant(5.0), //Event will trigger every 5 seconds
                        isActive: !barcodeFound
                    ){
                        //When the scanner found a barcode
                        print("BarCodeType =", $0.type.rawValue, "Value =", $0.value)
                        productCode = $0.value
                        barcodeFound = true
                    }
                    onDraw: {
                        //print("Preview View Size = \($0.cameraPreviewView.bounds)")
                        //print("Barcode Corners = \($0.corners)")
                        
                        //line width
                        let lineWidth = 5
                        
                        //line color
                        let lineColor = UIColor.red
                        
                        //Fill color with opacity
                        //You also can use UIColor.clear if you don't want to draw fill color
                        let fillColor = UIColor(red: 0, green: 1, blue: 0.2, alpha: 0.4)
                        
                        //Draw box
                        $0.draw(lineWidth: CGFloat(lineWidth), lineColor: lineColor, fillColor: fillColor)
                    }
                    .cornerRadius(30)
                    .padding()
                    Image(systemName: "viewfinder")
                        .resizable()
                        .foregroundColor(.secondary)
                        .frame(width: 250.0, height: 250)
                }
            }
            .navigationTitle("Scan")
        }
        .sheet(isPresented: $barcodeFound) {
            AddRetrieveView(productCode: productCode).interactiveDismissDisabled(true)
        }
        .popup(isPresented: $barcodeFound) {
            Text("Barcode letto correttamente!")
                .frame(width: 300, height: 80)
                .background(Color.gray)
                .cornerRadius(30.0)
        } customize: {
            $0
                .type(.floater())
                .position(.top)
                .animation(.spring())
                .closeOnTapOutside(true)
                .backgroundColor(.black.opacity(0.5))
        }
        
    }
}

struct AddScanView_Previews: PreviewProvider {
    static var previews: some View {
        AddScanView()
    }
}
