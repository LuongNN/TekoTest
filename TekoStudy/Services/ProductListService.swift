//
//  ProductListService.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Foundation
public typealias ProductsLoaderCompletion = (Result<[Product], TekoError>) -> Void

class ProductsLoader {
    // MARK: - Properties
    private (set) var hasMore: Bool = false
    private var page: Int = 1
    private var query: String = ""
    private var isLoading: Bool = false
    
    
    // MARK: - Initialization
    init(query: String, page: Int) {
        self.page = page
        self.query = query
    }
    
    // MARK: - Fetch shops
    func load(page: Int = 1, completion: @escaping ProductsLoaderCompletion) {
        guard isLoading == false else { return }
        isLoading = true
        let products = Teko.productList(query: query, page: page)
        TekoService.request(products){ [weak self] result in
            guard let self = self else {
                completion(.failure(TekoError.network("The referenced instance was released")))
                return
            }
            self.isLoading = false
            switch result {
            case .success(let response):
                do {
                    let products = try response.map(ProductListResponse.self).result.products
                    self.hasMore = products.count > 0
                    completion(.success(products))
                } catch {
                    completion(.failure(TekoError.network("Parse Error")))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func next(completion: @escaping ProductsLoaderCompletion) {
        guard isLoading == false else { return }
        page += 1
        load(page: page, completion: completion)
    }
    
    func refresh() {
        page = 1
    }
}
