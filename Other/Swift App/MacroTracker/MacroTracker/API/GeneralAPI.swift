//
//  GeneralAPI.swift
//  MacroTracker
//
//  Created by Alessandro Sironi on 27/03/23.
//

import Foundation

struct WebServiceConstants {
    var scheme: String
    var host: String
    var path: String
}

class GeneralAPI {
    
    private let Constants: WebServiceConstants
    public enum RequestError: Error {
        case wrongRequest
        case parsing
        case unauthorized
        case noResults
        case server(code: Int)
        case unknown
    }
    
    init(Constants: WebServiceConstants) {
        self.Constants = Constants
    }
    
    public func defineUrl(by action: String, parameters: [URLQueryItem]?) -> URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.host
        components.path = Constants.path + action
        components.queryItems = parameters
        return components.url
    }
    
    public func sendRequest<T: Decodable>(url: URL?, responseModel: T.Type) async -> Result<T, RequestError> {
        guard let url = url else {
            return .failure(.wrongRequest)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url), delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResults)
            }
            switch response.statusCode {
                case 200...299:
                    guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                        return .failure(.parsing)
                    }
                    return .success(decodedResponse)
                case 401:
                    return .failure(.unauthorized)
                default:
                    return .failure(.server(code: response.statusCode))
            }
        } catch {
            return .failure(.unknown)
        }
    }
}

