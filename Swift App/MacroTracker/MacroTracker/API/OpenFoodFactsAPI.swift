//
//  OpenFoodFactsAPI.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import Foundation

class OpenFoodFactsAPI {
    
    private let API: GeneralAPI
    
    public struct Response: Codable {
        let barcode: String
        let product: ResponseProduct
        let status: Int
    }
    
    public struct ResponseProduct: Codable {
        let name: String
        let brand: String
        let nutriments: ResponseProductNutrients
    }
    
    public struct ResponseProductNutrients: Codable {
        let kcal: Float
        let carbs: Float
        let proteins: Float
        let fats: Float
        
        private enum CodingKeys: String, CodingKey {
            case
            kcal = "energy-kcal_100g",
            carbs = "carbohydrates_100g",
            proteins = "proteins_100g",
            fats = "fat_100g"
        }
    }
    
    init() {
        self.API = GeneralAPI(Constants: WebServiceConstants(
            scheme: "https",
            host: "world.openfoodfacts.org",
            path: "/api/v2/"
        ))
    }
    
    public func getProduct(id: String) async -> FoodItem? {
        let action: String = "product/" + id + ".json"
        let response = await self.API.sendRequest(
            url: self.API.defineUrl(by: action, parameters: []),
            responseModel: Response.self
        )
        
        do{
            let responseItem = try response.get()
            
            let foodItem = FoodItem(name: responseItem.product.name, barcode: responseItem.barcode, brand: responseItem.product.brand, kcal: responseItem.product.nutriments.kcal, carbs: responseItem.product.nutriments.carbs, proteins: responseItem.product.nutriments.proteins, fats: responseItem.product.nutriments.fats)
            
            return foodItem
        } catch {
            print("Fail")
            return nil
        }
    }
}
