//
//  ProductListView.swift
//  ProductStore
//
//  Created by shagar on 24/09/26.
//

import SwiftUI


struct ProductListView : View {
    @StateObject var viewModel : ProductListViewModel
    private let columns = [
        GridItem(.flexible(),spacing: 12),
        GridItem(.flexible(),spacing: 12)
    ]
    init(viewModel: ProductListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                }
                else {
                    contentView
                }
            }
            .task {
                await viewModel.fetchInitialProducts()
            }
        }
        
        
        
    }
    
    private var contentView : some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(viewModel.products) {product in
                    ProductRowView(product: product)
                        .task {
                            await viewModel.fetchMoreProducts(product: product)
                        }
                }
            }
        }
        .padding(20)
        
    }
    
}
