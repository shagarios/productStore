//
//  ProductRowView.swift
//  ProductStore
//
//  Created by shagar on 27/09/26.
//

import SwiftUI

struct ProductRowView : View {
    let product : Product
    
    var body: some View {
        VStack {
            image
            title
        }
        .cardStyle()

    }
    
    private var image : some View {
        VStack {
            AsyncImage(url: URL(string: product.thumbnail ?? "")) {phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                    
                case .failure(_):
                    Image(systemName: "photo")
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                default:
                    EmptyView()
                    
                }
            }
        }
    }
    private var title : some View {
        VStack {
            Text(product.title ?? "")
        }
    }
    
}
