//
//  KeyboardManager.swift
//  Takeout_iOS
//
//  Created by Ngoc Luong on 11/5/18.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import Foundation
import IQKeyboardManager

struct KeyboardManager {
    static func setup() {
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        IQKeyboardManager.shared().shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
    }
}
