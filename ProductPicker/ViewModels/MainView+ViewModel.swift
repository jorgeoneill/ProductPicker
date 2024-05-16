//
//  MainView+ViewModel.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 16/05/2024.
//

import Foundation

extension MainView {
    @Observable
    class ViewModel {
        // MARK: - Private(set) properties
        private(set) var emptyViewTitle: String?
        private(set) var footerTitle: String
        private(set) var navigationTitle: String
        private(set) var cellViewModels:  [CellView.ViewModel]

        // MARK: - Lifecycle
        init(products: [ProductCatalog.Product] = [ProductCatalog.Product]()) {
            self.cellViewModels = products.map { product in
                CellView.ViewModel(product: product)
            }
            self.emptyViewTitle = products.isEmpty ? Constants.Text.emptyViewTitle : nil
            self.footerTitle = "\(Constants.Text.numberOfProductsLabel)\(products.count)"
            self.navigationTitle = Constants.Text.defaultNavigationTitle
        }
    }
}
