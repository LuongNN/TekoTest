//
//  ListProductCell.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/12/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import UIKit

class ListProductCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var sellPriceView: CurrencyView!
    @IBOutlet weak var supplierSalePriceLabel: UILabel!
    @IBOutlet weak var promotionPercentView: UIView!
    @IBOutlet weak var promotionPercentLabel: UILabel!
    @IBOutlet weak var promotionStackView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(product: Product){
        nameProductLabel.text = product.name
        //if let sellPrice = product.price.sellPrice {
        sellPriceView.text = product.price.sellPrice?.formatNumber(separator: ".")
        //}
        if let supplierSalePrice = product.price.supplierSalePrice, let sellPrice = product.price.sellPrice {
            let attributedString = NSMutableAttributedString(string: supplierSalePrice.formatNumber(separator: "."))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            supplierSalePriceLabel.attributedText = attributedString
            let percentage = (supplierSalePrice - sellPrice) * 100 / supplierSalePrice
            promotionPercentLabel.text = "\(percentage)%"
            promotionStackView.isHidden = false
        } else {
            promotionStackView.isHidden = true
        }
    }
    
}
