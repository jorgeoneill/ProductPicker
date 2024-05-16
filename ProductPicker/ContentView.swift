//
//  ContentView.swift
//  ProductPicker
//
//  Created by Jorge O'Neill on 15/05/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ProductCatalog.Product.title) private var products: [ProductCatalog.Product]
      
    var body: some View {
        MainView(viewModel: MainView.ViewModel(products: products))
            .task {
                // Uncomment below, should you wish to reset data
                // DataService.resetUserDefaults()
                do {
                    try await DataService.retrieveProducts(into: modelContext)
                } catch {
                    print(error)
                }
            }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ProductCatalog.Product.self)
}
