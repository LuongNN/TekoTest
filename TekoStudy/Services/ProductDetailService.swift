//
//  ProductDetailService.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Foundation

public typealias ProductDetailCompletion = (Result<Product, TekoError>) -> Void

public struct ProductDetailService {
    
    public static func getProductDetail(productId: String, completion: @escaping ProductDetailCompletion) {
        TekoService.request(.productDetail(productId: productId)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let shop = try response.map(ProductResponse.self).result.product
                    completion(.success(shop))
                } catch {
                    completion(.failure(TekoError.network("Parse Error")))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
