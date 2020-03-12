//
//  NibLoadableView.swift
//  Takeout_iOS
//
//  Created by Ngoc Luong on 2018/10/03.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView { }
extension UICollectionViewCell: NibLoadableView { }
extension UITableViewHeaderFooterView: NibLoadableView { }
