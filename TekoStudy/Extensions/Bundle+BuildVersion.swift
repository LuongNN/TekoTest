//
//  Bundle+BuildVersion.swift
//  TakeoutShop
//
//  Created by Seesaa on 12/4/18.
//  Copyright © 2018 Seesaa Inc. All rights reserved.
//

import UIKit

extension Bundle {
    var releaseVersionNumber: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersionNumber: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }
}
