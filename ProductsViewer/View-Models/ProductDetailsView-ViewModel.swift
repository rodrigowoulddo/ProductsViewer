//
//  ProductDetailsView-ViewModel.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import Foundation

extension ProductDetailsView {
    
    // MARK: - ViewModel
    class ViewModel: ObservableObject {
        
        // MARK: - Attributes
        let product: Product
        
        // MARK: - Lifecycle
        init(product: Product) {
            
            self.product = product
        }
        
        // MARK: - Data and Formatting
        var mainImageUrl: URL? {
            
            guard let imageUrl = self.product.images.first else { return nil }
            
            return URL(string: imageUrl)
        }
        
        var formattedPrice: String {
            
            return "$ \(self.product.price)"
        }
        
        var formattedDiscount: String {
            
            return "\(self.product.discountPercentage)% off"
        }
        
        var formattedStock: String {
            
            return "\(self.product.stock) left"
        }
        
        var formattedRating: String {
            
            return "\(self.product.rating)/5"
        }
    }
}
