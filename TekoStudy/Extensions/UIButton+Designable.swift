//
//  UIButton+Ext.swift
//  DanBApp
//
//  Created by Nguyen Van Quyen on 10/9/17.
//  Copyright © 2017 Seesaa Inc. All rights reserved.
//

import UIKit

extension UIButton {
    
    @IBInspectable var highlightedColor: UIColor {
        get {
            return UIColor.clear
        }
        set (color) {
            let image = UIImage(color: color, size: CGSize(width: self.frame.size.width * 2, height: self.frame.size.height * 2))
            self.setBackgroundImage(image, for: .highlighted)
        }
    }
 
    @IBInspectable var normalColor: UIColor {
        get {
            return UIColor.clear
        }
        set (color) {
            let image = UIImage(color: color, size: CGSize(width: self.frame.size.width * 2, height: self.frame.size.height * 2))
            self.setBackgroundImage(image, for: .normal)
        }
    }
    
    @IBInspectable var inactiveColor: UIColor {
        get {
            return UIColor.clear
        }
        set (color) {
            let image = UIImage(color: color, size: CGSize(width: self.frame.size.width * 2, height: self.frame.size.height * 2))
            self.setBackgroundImage(image, for: .disabled)
        }
    }
    
    @IBInspectable public var imageForDisabled: UIImage? {
        get {
            return image(for: .disabled)
        }
        set {
            setImage(newValue, for: .disabled)
        }
    }
    
    @IBInspectable public var imageForHighlighted: UIImage? {
        get {
            return image(for: .highlighted)
        }
        set {
            setImage(newValue, for: .highlighted)
        }
    }
    
    @IBInspectable public var imageForNormal: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
}
