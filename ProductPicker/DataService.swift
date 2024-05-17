//
//  DataService.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 15/05/2024.
//

import Foundation
import SwiftData

@MainActor
struct DataService {
    // MARK: - Network request and persistent storage using SwiftData
    static func retrieveProducts(into context: ModelContext) async throws {
        // As specified that data should be requested ONLY on first start, the code below including network requests should be guarded against all products having already been localy stored.
        // Probably a cache mecanism would be a more efficient solution on a similar real life app.
        guard !DataService.allProductsRetrieved else {
            print("[DataService] All products retrieved, no need for new network request.")
            return
        }
        
        try context.delete(model: ProductCatalog.Product.self)
        
        guard let url = URL(string: Constants.API.fetchProductsUrl) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }
        
        let productCatalog = try JSONDecoder().decode(ProductCatalog.self, from: data)
        
        guard 
            let products = productCatalog.products,
            let totalNrOfProducts = productCatalog.total
        else { return }
        
        // Iterating by index to ensure that all intended products are actually received and stored
        for index in 0..<products.count {
            context.insert(products[index])
            if index >= totalNrOfProducts - 1 {
                DataService.allProductsRetrieved = true
                print ("[DataService] All products retrieved.")
            }
        }
    }
    
    // MARK: - User defaults
    static var allProductsRetrieved: Bool {
        get {
            guard let value = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.allProductsRetrieved) as? Bool else {
                return false
            }

            return value
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.UserDefaultsKeys.allProductsRetrieved)
        }
    }
    
    // In case we need to reset
    static func resetUserDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
