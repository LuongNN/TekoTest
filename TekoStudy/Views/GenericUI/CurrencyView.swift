//
//  CurrencyView.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/12/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyView: UIView {

    final var view: UIView!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    final func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    final func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CurrencyView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func configCurrency(sellerPrice: Int) {
        currencyLabel.text = sellerPrice.formatNumber(separator: ".")
    }

}
