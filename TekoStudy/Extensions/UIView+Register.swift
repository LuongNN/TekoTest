//
//  UIView+Register.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/03.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

extension UIView {
        
    static func load<T: UIView>(_: T.Type) -> T {
        let nibViews = UINib(nibName: String(describing: T.self), bundle: nil).instantiate(withOwner: self, options: nil)
        guard let view = nibViews.first as? T else {
            fatalError("Could not load view with identifier: \(T.self)")
        }
        return view
    }
}
