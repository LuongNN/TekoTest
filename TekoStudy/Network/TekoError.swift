//
//  TekoError.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Moya

public enum TekoError: Error {
    case internet // network error
    case network(String) // 500
    
    init(_ error: Error) {
        // internet error
        if (error as NSError).code == NSURLErrorNotConnectedToInternet {
            self = TekoError.internet
        } else {
            self = TekoError.network(error.localizedDescription)
        }
    }
}
