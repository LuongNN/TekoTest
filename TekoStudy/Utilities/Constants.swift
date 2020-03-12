//
//  Constants.swift
//  TakeoutShop
//
//  Created by Ngoc Luong on 1/24/19.
//  Copyright © 2019 Seesaa Inc. All rights reserved.
//

import Foundation

public struct Constants {
    static let timeForRefresh: TimeInterval = 300 //seconds
    struct UserDefault {
        static let PushTokenKey = "FCMPushTokenKey"
        static let orderedChangedNewest = "OrderedChangedNewest"
        static let canceledByUserChangedNewest = "CanceledByUserChangedNewest"
        static let didTapAnnouncementNotification = "DidTapAnnouncementNotification"
    }
    
}
