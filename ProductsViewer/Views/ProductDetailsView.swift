//
//  ProductDetailsView.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import SwiftUI

// MARK: -  ProductDetailsView
struct ProductDetailsView: View {
    
    // MARK: - State
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {
                
                self.mainProductImage()
                
                self.priceStack()
                
                self.priceAndStockStack()
                
                self.descriptionAndBrandStack()
            }
            .padding(12)
        }
        .navigationTitle(self.viewModel.product.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Subviews
private extension ProductDetailsView {
    
    func mainProductImage() -> some View {
        
        return HStack {
            
            Spacer()
            AsyncImage(url: self.viewModel.mainImageUrl) { image in
                
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .padding(10)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
            } placeholder: {
                
                ProgressView()
                    .frame(width:200, height: 250)
            }
            
            Spacer()
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    func priceStack() -> some View {
        
        return VStack(alignment: .leading) {
            
            Text("Price")
                .font(.headline)
            Text(self.viewModel.formattedPrice)
                .font(.largeTitle)
                .foregroundStyle(.green)
        }
    }
    
    func priceAndStockStack() -> some View {
        
        return HStack(spacing: 24){
            
            VStack(alignment: .leading) {
                
                Text("Discount")
                    .font(.headline)
                Text(self.viewModel.formattedDiscount)
                    .font(.title2)
                    .foregroundStyle(.red)
            }
            
            VStack(alignment: .leading) {
                
                Text("Stock")
                    .font(.headline)
                Text(self.viewModel.formattedStock)
                    .font(.title2)
            }
            
            VStack(alignment: .leading) {
                
                Text("Rating")
                    .font(.headline)
                Text(self.viewModel.formattedRating)
                    .font(.title2)
            }
        }
    }
    
    func descriptionAndBrandStack() -> some View {
        
        return VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading) {
                
                Text("Description")
                    .font(.headline)
                Text(self.viewModel.product.description)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                
                Text("Brand")
                    .font(.headline)
                Text(self.viewModel.product.brand)
                    .font(.body)
            }
            
            VStack(alignment: .leading) {
                
                Text("Category")
                    .font(.headline)
                Text(self.viewModel.product.category)
                    .font(.body)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    
    let product = Product.mock(title: "Awesome Product", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut ligula non orci porta luctus. Nam ut enim non risus vulputate gravida eget aliquet lectus")
    let viewModel = ProductDetailsView.ViewModel(product: product)
    
    return NavigationStack {
        
        ProductDetailsView(viewModel: viewModel)
    }
}
