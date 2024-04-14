//
//  ProductServiceMock.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import Foundation

// MARK: - Mock
class ProductServicePreviewMock: ProductServiceProtocol {
    
    func fetchProducts(limit: Int, skip: Int) async throws -> [Product] {
        
        return [
            Product.mock(title: "First Product", description: "Lorem ipsum dolor sit amet.", rating: 0.0),
            Product.mock(title: "Second Product", description: "Lorem ipsum dolor sit amet.", rating: 3.0),
            Product.mock(title: "Third Product", description: "Lorem ipsum dolor sit amet.", rating: 3.5),
            Product.mock(title: "Fourth Product", description: "Lorem ipsum dolor sit amet.", rating: 4.0),
            Product.mock(title: "Fifth Product", description: "Lorem ipsum dolor sit amet.", rating: 5.0),
            Product.mock(title: "Sixth Product", description: "Lorem ipsum dolor sit amet.")
        ]
    }

}
