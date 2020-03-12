//
//  Teko.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Moya

public enum Teko {
    case productList(query: String, page: Int)
    case productDetail(productId: String)
}

extension Teko: TargetType {
    public var baseURL: URL {
        return URL(string: "https://listing.stage.tekoapis.net")!
    }
    public var path: String {
        switch self {
        case .productList:
            return "/api/search"//?channel=pv_showroom&visitorId=&q=&terminal=CP01"
        case .productDetail(let productId):
            return "/api/products/\(productId)" //{product_sku}?channel=pv_showroom&terminal=CP01"
        }
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .productList(let query, let page):
            var parameters: [String: Any] = [:]
            parameters += ["channel": "pv_online",
                           "_page": page,
                           "q": query,
            "visitorId": "",
            "terminal": "CP01"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .productDetail:
            var parameters: [String: Any] = [:]
            parameters += ["channel": "pv_online",
                           "terminal": "CP01"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        var assigned: [String: String] = [:]
        assigned += ["Content-Type": "application/json"]
        return assigned
    }
    
    
    
}
