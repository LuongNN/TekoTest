//
//  Delay.swift
//  Takeout_iOS
//
//  Created by Kazutoshi Baba on 2018/10/05.
//  Copyright © 2018 SeesaaVN. All rights reserved.
//

import Foundation

// A delay function
func delay(seconds: Double, completion:@escaping () -> Void) {
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}
