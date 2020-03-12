//
//  UITabBar+Ext.swift
//  TakeoutShop
//
//  Created by Ngoc Luong on 11/5/18.
//  Copyright © 2018 Seesaa Inc. All rights reserved.
//

import UIKit

extension UITabBar {
    // Workaround for iOS 11's new UITabBar behavior where on iPad, the UITabBar inside
    // the Master view controller shows the UITabBarItem icon next to the text
    override open var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UITraitCollection(horizontalSizeClass: .compact)
        }
        return super.traitCollection
    }
}
