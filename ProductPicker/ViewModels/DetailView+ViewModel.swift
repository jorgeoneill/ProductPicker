//
//  DetailView+ViewModel.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 16/05/2024.
//

import Foundation
import SwiftUI

extension DetailView {
    @Observable
    class ViewModel {
        // MARK: - Private(set) properties
        private(set) var title: String
        private(set) var subtitle: String
        private(set) var imageURL: URL?

        // MARK: - Lifecycle
        init(
            title: String?,
            rating: Double?,
            imageURLString: String?
        ) {
            self.title = title ?? Constants.Text.defaultProductTitle
            if let rating {
                self.subtitle = "\(Constants.Text.ratingLabel)\(rating)"
            } else {
                self.subtitle = Constants.Text.defaultProductSubtitle
            }
            if let imageURLString {
                self.imageURL = URL(string: imageURLString)
            } else {
                self.imageURL = nil
            }
        }
    }
}
