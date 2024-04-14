//
//  ProductsListView.swift
//  ProductsViewer
//
//  Created by Rodrigo Giglio on 13/04/2024.
//

import SwiftUI

// MARK: - ProductsListView
struct ProductsListView: View {
    
    // MARK: - State
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(self.viewModel.products) { product in
                    
                    NavigationLink {
                        
                        self.productDetailsView(for: product)
                        
                    } label: {
                        
                        self.productRow(for: product)
                    }
                }
                
                Button {
                    
                    self.viewModel.loadMoreItems()
                    
                } label: {
                    
                    HStack {
                        
                        Spacer()
                        Text("Load more")
                        Spacer()
                        
                    }.padding(8)
                }
            }
            .onAppear {
                
                self.viewModel.loadMoreItems()
            }
            .alert("Unable to load products", isPresented: self.$viewModel.shouldShowError) {
                
                Button("OK", role: .cancel) { }
            }
            .navigationTitle("Products")
        }
    }
}

// MARK: - SubViews
private extension ProductsListView {
    
    func productRow(for product: Product) -> some View {
        
        return HStack {
            
            self.thumbnailImage(for: product)
            
            self.detailsStack(for: product)
            
            Spacer()
            
            self.ratingImage(for: product.rating)
        }
    }
    
    func productDetailsView(for product: Product)  -> some View {
        
        let productDetailsViewmodel = ProductDetailsView.ViewModel(product: product)
        
        return ProductDetailsView(viewModel: productDetailsViewmodel)
    }
    
    func thumbnailImage(for product: Product) -> some View {
        
        return AsyncImage(url: self.viewModel.thumbnailUrl(for: product)) { image in
            
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
        } placeholder: {
            
            ProgressView()
                .frame(width: 50, height: 50)
        }
    }
    
    func detailsStack(for product: Product) -> some View {
        
        return VStack(alignment: .leading) {
            
            Text(product.title)
                .font(.body)
            Text(product.description)
                .lineLimit(2)
                .font(.caption)
        }
    }
    
    func ratingImage(for rating: Double) -> some View {
        
        return Image(systemName: self.viewModel.imageName(for: rating))
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundStyle(.gray)
    }
}

// MARK: - Preview
#Preview {
    
    let service = ProductServicePreviewMock()
    let viewModel = ProductsListView.ViewModel(service: service)
    
    return ProductsListView(viewModel: viewModel)
}
