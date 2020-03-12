//
//  UINavigationController+StatusBar.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/05.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
