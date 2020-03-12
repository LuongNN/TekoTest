//
//  TekoService.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import Moya

public typealias TekoServiceCompletion = (Result<Moya.Response, TekoError>) -> Void

public struct TekoService {
    static let provider = MoyaProvider<Teko>(session: DefaultAlamofireManager.shared)
    public static func request(_ target: Teko, completion: @escaping TekoServiceCompletion) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(TekoError(error)))
            }
        }
    }
}

class DefaultAlamofireManager: Alamofire.Session {
    static let shared: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 100
        let manager = DefaultAlamofireManager(configuration: configuration, startRequestsImmediately: false)
        return manager
    }()
}
