//
//  StoryBoardHelper.swift
//  DanBApp
//
//  Created by dang nguyenhuu on 2017/06/22.
//  Copyright © 2017 Seesaa Inc. All rights reserved.
//

import UIKit

protocol StoryboardHelper {}

extension StoryboardHelper where Self: UIViewController {

    static func instantiate(storyboard: Storyboard) -> Self {
        let storyboard = UIStoryboard.storyboard(storyboard)
        return storyboard.instantiateViewController(ofType: Self.self)
    }

}

extension UIViewController: StoryboardHelper {}
