//
//  ProductMock.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import Foundation

// MARK: - Mock
extension Product {
    
    public static func mock(title: String,
                            description: String,
                            rating: Double = 4.0) -> Product {
        
        return Product(title: title,
                       description: description,
                       price: 10,
                       discountPercentage: 10,
                       rating: rating,
                       stock: 5,
                       brand: "Cool Brand",
                       category: "Cool Category",
                       thumbnail: "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg",
                       images: [
                        "https://cdn.dummyjson.com/product-images/2/1.jpg",
                        "https://cdn.dummyjson.com/product-images/2/2.jpg",
                        "https://cdn.dummyjson.com/product-images/2/3.jpg"
                       ])
    }
}
