//
//  ProductsViewerApp.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import SwiftUI

@main
// MARK: - ProductsViewerApp
struct ProductsViewerApp: App {
    
    // MARK: - Attributes
    let productsListViewModel: ProductsListView.ViewModel
    
    // MARK: - Lifecycle
    init() {
        
        self.productsListViewModel = ProductsListView.ViewModel(service: ProductService())
    }
    
    // MARK: - Body
    var body: some Scene {
        
        WindowGroup {
            
            ProductsListView(viewModel: self.productsListViewModel)
        }
    }
}
