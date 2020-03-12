//
//  Product.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Foundation

public struct Product: Codable {
    public let sku: String
    public let name: String
    public let url: String
    public let price: Price
    //public let images: [String]
//    public let seller: Seller
//    public let brand: Brand
//    public let status: 	Status
//    public let objective: Objective
//    public let productType: ProductType
//    public let productLine: ProductLine
//    public let stocks: [Int]
//    public let totalAvailable: Int
//    public let isBundle: Bool
//    public let bundleProducts: String
//    public let parentBundles: String
//    public let totalAvailableByStocks: [AvailableByStock]
//    public let displayName: String
//    public let color: Color
//    public let tags: [Int]
   
    
}

extension Product {
   public struct Price: Codable {
        public let supplierSalePrice: Int?
        public let sellPrice: Int?
    }
}
