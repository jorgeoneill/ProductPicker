//
//  Constants.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 15/05/2024.
//

import SwiftUI

enum Constants {
    enum API {
        // A more flexible and robust solution would employ QueryItems to construct the URL.
        static let fetchProductsUrl = "https://dummyjson.com/products?limit=0"
    }
    enum UserDefaultsKeys {
        static let allProductsRetrieved = "allProductsRetrieved"
    }
    
    enum Text {
        static let ratingLabel = "Rating: "
        static let defaultProductTitle = "No title"
        static let defaultProductSubtitle = "No rating"
        static let emptyViewTitle = "Loading products list..."
        static let numberOfProductsLabel = "Number of products: "
        static let defaultNavigationTitle = "Products"
    }
    
    enum Emoji {
        static let badRating = "👎"
        static let goodRating = "👍"
        static let greatRating = "👌"
        static let unkownRating = "🤔"
    }
    
    enum UI {
        static let regularFontOpacity = 0.8
        static let lightFontOpacity = 0.5
        static let cellIconRadius = 50.0
        static let cellBackgroundColor = Color.gray.opacity(0.5)
    }
}
