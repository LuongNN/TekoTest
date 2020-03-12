//
//  CALayer+Shadow.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/05.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

extension CALayer {
    // https://stackoverflow.com/questions/34269399/how-to-control-shadow-spread-and-blur/48489506#48489506
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.07,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
