//
//  ProductsListView-ViewModelTests.swift
//  ProductsViewerTests
//
//  Created by Rodrigo Giglio on 14/04/2024.
//

import XCTest
@testable import ProductsViewer

// MARK: - ProductsListViewModelTests
class ProductsListViewModelTests: XCTestCase {
    
    func testViewModelConvertsBadRatingToBagImage() {
        
        let product = Product.mock(title: "A product", description: "A description", rating: 1.0)
        let service = ProductServiceMock()
        let viewModel = ProductsListView.ViewModel(service: service)
        
        let imageName = viewModel.imageName(for: product.rating)
        
        XCTAssertEqual(imageName, "hand.thumbsdown.fill")
    }
    
    func testViewModelConvertsRegularRatingToRegularImage() {
        
        let product = Product.mock(title: "A product", description: "A description", rating: 3.0)
        let service = ProductServiceMock()
        let viewModel = ProductsListView.ViewModel(service: service)
        
        let imageName = viewModel.imageName(for: product.rating)
        
        XCTAssertEqual(imageName, "hand.thumbsup.fill")
    }
    
    func testViewModelConvertsGoodRatingToGoodImage() {
        
        let product = Product.mock(title: "A product", description: "A description", rating: 4.5)
        let service = ProductServiceMock()
        let viewModel = ProductsListView.ViewModel(service: service)
        
        let imageName = viewModel.imageName(for: product.rating)
        
        XCTAssertEqual(imageName, "star.fill")
    }
    
    func testViewModelConvertsInvalidRatingToInvalidImage() {
        
        let product = Product.mock(title: "A product", description: "A description", rating: -1)
        let service = ProductServiceMock()
        let viewModel = ProductsListView.ViewModel(service: service)
        
        let imageName = viewModel.imageName(for: product.rating)
        
        XCTAssertEqual(imageName, "questionmark.diamond.fill")
    }
}

// MARK: - ProductServiceMock
class ProductServiceMock: ProductServiceProtocol {
    
    func fetchProducts(limit: Int, skip: Int) async throws -> [Product] {
        
        return []
    }
}
