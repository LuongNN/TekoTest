//
//  MenuCell.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/13/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import UIKit
import PagingKit

class MenuCell: PagingMenuViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    public var focusColor = UIColor(named: "262829")! {
        didSet {
            if isSelected {
                titleLabel.textColor = focusColor
            }
        }
    }
    
    /// The normal text color.
    public var normalColor = UIColor(named: "8F9598")! {
        didSet {
            if !isSelected {
                titleLabel.textColor = normalColor
            }
        }
    }
    
    override public var isSelected: Bool {
        didSet {
            if isSelected {
                titleLabel.textColor = focusColor
            } else {
                titleLabel.textColor = normalColor
            }
        }
    }

}
