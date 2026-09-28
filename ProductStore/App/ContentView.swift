//
//  ContentView.swift
//  ProductStore
//
//  Created by shagar on 24/09/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack {
        ProductListView(viewModel:
        ProductListViewModel(repository: ProductRepositoryImplementation(apiService: AlamofireService())))
        }
    }
}

#Preview {
    ContentView()
}
