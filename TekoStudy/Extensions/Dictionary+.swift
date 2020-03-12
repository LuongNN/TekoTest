//
//  Dictionary+.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/09/27.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

public func += <KeyType, ValueType>(lhs: inout [KeyType: ValueType], rhs: [KeyType: ValueType]) {
    for (k, v) in rhs {
        lhs.updateValue(v, forKey: k)
    }
}
