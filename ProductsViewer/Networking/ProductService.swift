//
//  ProductService.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import Foundation

// MARK: - ProductServiceProtocol
protocol ProductServiceProtocol {
    
    func fetchProducts(limit: Int, skip: Int) async throws -> [Product]
}

// MARK: - ProductsResponse
struct ProductsResponse: Decodable {
    
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

// MARK: - ProductService
class ProductService: ProductServiceProtocol {
    
    // MARK: - ProductServiceError
    enum ProductServiceError: Error {
        
        case invalidUrl
    }
    
    // MARK: - Constants
    private enum Constants {
        
        static let productsApiUrl: String = "https://dummyjson.com/products"
        static let limitRequestKey: String = "limit"
        static let skipRequestKey: String = "skip"
        static let cacheDiskPath: String = "productServiceCache"
        static let cacheMemoryCapacity: Int = 0
        static let cacheDiskCapacity: Int = 100 * 1024 * 10024 // 1mb
    }
    
    // MARK: - Private Attributes
    private let cache: URLCache
    private let urlSession: URLSession
    
    // MARK: - Lifecycle
    init() {
        
        self.cache = URLCache(memoryCapacity: Constants.cacheMemoryCapacity,
                              diskCapacity: Constants.cacheDiskCapacity,
                              diskPath: Constants.cacheDiskPath)
        
        let urlSessionConfig = URLSessionConfiguration.default
        urlSessionConfig.urlCache = self.cache
        urlSessionConfig.requestCachePolicy = .returnCacheDataElseLoad
        
        self.urlSession = URLSession(configuration: urlSessionConfig)
    }
    
    // MARK: - Internal Methods
    func fetchProducts(limit: Int, skip: Int) async throws -> [Product] {
        
        guard var url = URL(string: Constants.productsApiUrl) else {
            
            throw ProductServiceError.invalidUrl
        }
        
        let queryItems = [URLQueryItem(name: Constants.limitRequestKey, value: String(limit)),
                          URLQueryItem(name: Constants.skipRequestKey, value: String(skip))]
        
        url.append(queryItems: queryItems)
                
        let (data, _) = try await self.urlSession.data(from: url)
        
        let productsResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
        
        return productsResponse.products
    }
}
