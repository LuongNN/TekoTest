//
//  UIViewController+Loading.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/04.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    func startAnimating() {
        guard !isAnimating else { return }

        // #32 https://github.com/ninjaprox/NVActivityIndicatorView
        startAnimating(CGSize(width: 70, height: 70), type: NVActivityIndicatorType.circleStrokeSpin, color: UIColor(named: "F5471E"), padding: 20, backgroundColor: UIColor.clear)
    }
    
    func stopAnimating() {
        stopAnimating(nil)
    }
}
