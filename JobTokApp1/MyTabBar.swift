//
//  MyTabBar.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/26.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 58
        return size
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
