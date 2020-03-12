//
//  Int+Format.swift
//  Takeout_iOS
//
//  Created by LuongNguyen on 2018/10/10.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import Foundation
extension Int {
    func formatNumber(separator: String? = nil) -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = separator ?? ","
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self)) ?? ""
    }
}
