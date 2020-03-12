//
//  Storyboard+.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/03.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
}

extension UIStoryboard {
    
    class func storyboard(_ storyboardName: Storyboard) -> UIStoryboard {
        return UIStoryboard(name: storyboardName.rawValue, bundle: Bundle(for: AppDelegate.self))
    }
    
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
