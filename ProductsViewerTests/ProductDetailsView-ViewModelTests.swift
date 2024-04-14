//
//  ProductDetailsView-ViewModelTests.swift
//  ProductsViewerTests
//
//  Created by Rodrigo Giglio on 14/04/2024.
//

import XCTest
@testable import ProductsViewer

// MARK: - ProductDetailsViewModelTests
class ProductDetailsViewModelTests: XCTestCase {
    
    func testFormattedPrice() {
        
        let product = self.productMock(price: 100)
        let viewModel = ProductDetailsView.ViewModel(product: product)
        
        let formattedPrice = viewModel.formattedPrice
        
        XCTAssertEqual(formattedPrice, "$ 100")
    }
    
    func testFormatterDiscount() {
        
        let product = self.productMock(discountPercentage: 50.0)
        let viewModel = ProductDetailsView.ViewModel(product: product)
        
        let formattedDiscount = viewModel.formattedDiscount
        
        XCTAssertEqual(formattedDiscount, "50.0% off")
    }
    
    func testFormattedStock() {
        
        let product = self.productMock(stock: 30)
        let viewModel = ProductDetailsView.ViewModel(product: product)
        
        let formattedStock = viewModel.formattedStock
        
        XCTAssertEqual(formattedStock, "30 left")
    }
    
    func testFormattedRating() {
        
        let product = self.productMock(rating: 2.5)
        let viewModel = ProductDetailsView.ViewModel(product: product)
        
        let formattedRating = viewModel.formattedRating
        
        XCTAssertEqual(formattedRating, "2.5/5")
    }
}

// MARK: - Mocks
private extension ProductDetailsViewModelTests {
    
    func productMock(price: Int = 10,
                     discountPercentage: Double = 15.0,
                     rating: Double = 3.0,
                     stock: Int = 5) -> Product {
        
        return Product(title: "Product title",
                       description: "Product description",
                       price: price,
                       discountPercentage: discountPercentage,
                       rating: rating,
                       stock: stock,
                       brand: "Brand",
                       category: "Category",
                       thumbnail: "someurl.com",
                       images: ["someurl.com"])
    }
}
