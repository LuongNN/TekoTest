//
//  UIViewController+Popup.swift
//  TakeoutShop
//
//  Created by Nguyen Van Quyen on 2/22/19.
//  Copyright © 2019 Seesaa Inc. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentPopup(popupView: UIView, completed: @escaping () -> Void) {
        if let window = UIApplication.shared.keyWindow {
            removePopup()
            popupView.frame = window.bounds
            popupView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            popupView.tag = 9999
            window.addSubview(popupView)
            completed()
        }
    }
    
    func dismissPopup() {
        removePopup()
    }
    
    private func removePopup() {
        if let window = UIApplication.shared.keyWindow {
            if let popupView = window.viewWithTag(9999) {
                popupView.removeFromSuperview()
            }
        }
    }
}
