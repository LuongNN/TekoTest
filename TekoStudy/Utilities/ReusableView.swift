//
//  ReusableView.swift
//  Takeout_iOS
//
//  Created by Ngoc Luong on 2018/10/03.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }
