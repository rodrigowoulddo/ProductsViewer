//
//  ProductsListView-ViewModel.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import Foundation

extension ProductsListView {
    
    class ViewModel: ObservableObject {
                
        // MARK: - Published
        @Published var products: [Product] = []
        @Published var shouldShowError = false
        
        // MARK: - Attributes
        private let service: ProductServiceProtocol
        private var page: Int = 0
        
        // MARK: - Lifecycle
        init(service: ProductServiceProtocol) {
            
            self.service = service
        }
        
        // MARK: - Networking
        func loadMoreItems() {
            
            let limit = 10
            let skip = self.page * 10
            
            self.fetchProducts(limit: limit, skip: skip)
            
            self.page += 1
        }
        
        private func fetchProducts(limit: Int, skip: Int) {
            
            Task {
                
                do {
                    
                    let products = try await self.service.fetchProducts(limit: limit, skip: skip)
                    
                    await MainActor.run {
                        
                        self.products.append(contentsOf: products)
                    }
                    
                } catch {
                    
                    print(error.localizedDescription)
                    self.shouldShowError = true
                }
            }
        }
        
        // MARK: - Data and Formatting
        func thumbnailUrl(for product: Product) -> URL? {
            
            return URL(string: product.thumbnail)
        }
        
        func imageName(for rating: Double) -> String {
            
            switch rating {
                
            case 0..<3:
                return "hand.thumbsdown.fill"
            
            case 3..<4:
                return "hand.thumbsup.fill"
                
            case 4...Double.infinity:
                return "star.fill"
                
            default:
                return "questionmark.diamond.fill"
            }
        }
    }
}
