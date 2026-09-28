//
//  ProductStoreTests.swift
//  ProductStoreTests
//
//  Created by shagar on 24/09/26.
//

import XCTest
@testable import ProductStore

@MainActor
final class ProductListViewModelTest: XCTestCase {
    
    private var mockRepository : MockProductRepository!
    private var viewModel : ProductListViewModel!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockProductRepository()
        viewModel = ProductListViewModel(repository: mockRepository)
    }
    func test_fetchInitalProduct_success() async {
        await viewModel.fetchInitialProducts()
        XCTAssertEqual(viewModel.products.count, 1)
    }
    
    func test_fetchInitialProduct_failure() async {
        mockRepository.result = .failure(MockError.network)
        await viewModel.fetchInitialProducts()
        XCTAssertTrue(viewModel.products.isEmpty)
        XCTAssertEqual(viewModel.errorMessage, "Network error")
    }
}
