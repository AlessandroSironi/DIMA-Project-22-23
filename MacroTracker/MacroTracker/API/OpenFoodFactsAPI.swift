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
        let code: String
        let product: ResponseProduct
        let status: Int
    }
    
    public struct ResponseProduct: Codable {
        let product_name: String
        let brands: String
        let nutriments: ResponseProductNutrients
    }
    
    public struct ResponseProductNutrients: Codable {
        let energy: Int
        let proteins: Float
        let fat: Float
        let carbohydrates: Float
        let fiber: Float
        
        private enum CodingKeys: String, CodingKey {
            case
            energy = "energy-kcal_100g",
            proteins = "proteins_100g",
            fat = "fat_100g",
            carbohydrates = "carbohydrates_100g",
            fiber = "fiber_100g"
        }
    }
    
    init() {
        self.API = GeneralAPI(Constants: WebServiceConstants(
            scheme: "https",
            host: "world.openfoodfacts.org",
            path: "/api/v2/"
        ))
    }
    
    public func getProduct(id: String) async -> CommercialFoodItem? {
        let action: String = "product/" + id + ".json"
        let response = await self.API.sendRequest(
            url: self.API.defineUrl(by: action, parameters: []),
            responseModel: Response.self
        )
        do {
            return CommercialFoodItem(
                model: try response.get()
            )
        } catch {
            print("Failed")
            // Should throw an error
            return nil
        }
    }
}
