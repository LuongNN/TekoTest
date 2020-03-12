//
//  UIWindowVisible.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/11/02.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

public extension UIWindow {
    public var visibleViewController: UIViewController? {
        return UIWindow.visibleViewController(from: self.rootViewController)
    }
    
    public static func visibleViewController(from viewController: UIViewController?) -> UIViewController? {
        switch viewController {
        case let navigationController as UINavigationController:
            return UIWindow.visibleViewController(from: navigationController.visibleViewController)
            
        case let tabBarController as UITabBarController:
            return UIWindow.visibleViewController(from: tabBarController.selectedViewController)
            
        case let presentingViewController where viewController?.presentedViewController != nil:
            return UIWindow.visibleViewController(from: presentingViewController?.presentedViewController)
            
        default:
            return viewController
        }
    }
}
