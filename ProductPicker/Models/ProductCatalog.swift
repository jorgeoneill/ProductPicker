//
//  ProductCatalog.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 15/05/2024.
//

import Foundation
import SwiftData

struct ProductCatalog: Decodable {
    let products: [Product]?
    let total: Int?
    
    @Model
    // 'Product' needs do be a Class to conform with SwiftData's @Model macro, in order to ensure persistence.
    final class Product: Decodable {
        let title: String?
        let rating: Double?
        let thumbnail: String?
      
        init(
            title: String,
            rating: Double,
            thumbnail: String
        ) {
            self.title = title
            self.rating = rating
            self.thumbnail = thumbnail
        }
        
        // It also requires "manual" decoding from JSON.
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(String.self, forKey: .title)
            rating = try container.decode(Double.self, forKey: .rating)
            thumbnail = try container.decode(String.self, forKey: .thumbnail)
        }
        
        enum CodingKeys: CodingKey {
            case title
            case rating
            case thumbnail
        }
    }
}
