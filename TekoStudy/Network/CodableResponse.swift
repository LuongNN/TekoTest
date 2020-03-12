//
//  CodableResponse.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Foundation

struct ProductListResponse: Codable {
    let code: String
    let result: Result<Product>
}

extension ProductListResponse {
    struct Result<T: Codable>: Codable {
        let products: [T]
    }
}

struct ProductResponse: Codable {
    let code: String
    let result: Result<Product>
}

extension ProductResponse {
    struct Result<T: Codable>: Codable {
        let product: T
    }
}


