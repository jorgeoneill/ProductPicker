//
//  CellView+ViewModel.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 16/05/2024.
//

import Foundation

extension CellView {
    @Observable
    class ViewModel: Identifiable {
        // MARK: - Private(set) properties
        private(set) var title: String
        private(set) var subtitle: String
        private(set) var icon: String
        private(set) var detailViewModel: DetailView.ViewModel

        // MARK: - Lifecycle
        init(product: ProductCatalog.Product) {
            title = product.title ?? Constants.Text.defaultProductSubtitle
            if let rating = product.rating {
                self.subtitle = "\(Constants.Text.ratingLabel)\(rating)"
            } else {
                self.subtitle = Constants.Text.defaultProductSubtitle
            }
            
            if let rating = product.rating {
                switch rating {
                case _ where rating < 0.0:
                    self.icon = Constants.Emoji.unkownRating
                case 0..<3.0:
                    self.icon = Constants.Emoji.badRating
                case 3.0...4.0:
                    self.icon = Constants.Emoji.goodRating
                case _ where rating > 4.0:
                    self.icon = Constants.Emoji.greatRating
                default:
                    self.icon = Constants.Emoji.unkownRating
                }
            } else {
                self.icon = Constants.Emoji.unkownRating
            }
            
            self.detailViewModel = DetailView.ViewModel(
                title: product.title,
                rating: product.rating,
                imageURLString: product.thumbnail
            )
        }

    }
}

    
