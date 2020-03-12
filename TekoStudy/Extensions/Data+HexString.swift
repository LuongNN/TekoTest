//
//  Data+HexString.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/12/10.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import Foundation

extension Data {
    public var hexString: String {
        var string = ""
        
        enumerateBytes { (buffer, _, _) in
            buffer.forEach({ (byte) in
                string = string.appendingFormat("%02x", byte)
            })
        }
        return string
    }
}
