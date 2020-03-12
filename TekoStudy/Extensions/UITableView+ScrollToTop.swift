//
//  UITableView+ScrollToTop.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/25.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import UIKit

extension UITableView {
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    func scrollToTop(animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        if self.hasRowAtIndexPath(indexPath: indexPath) {
            self.scrollToRow(at: indexPath, at: .top, animated: animated)
        }
    }
}
