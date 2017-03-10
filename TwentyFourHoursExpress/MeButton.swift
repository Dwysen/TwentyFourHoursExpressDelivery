//
//  MeButton.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class MeButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame.origin.x = self.width / 2 - 30
        imageView?.frame.origin.y = self.height / 2 - 12.5
        imageView?.width = 25
        imageView?.height = (imageView?.width)!
        
        titleLabel?.frame.origin.x = self.width / 2 
        titleLabel?.frame.origin.y = self.height / 2 - 6
        titleLabel?.width = 35
        titleLabel?.height = 12
        titleLabel?.textAlignment = .left
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        titleLabel?.textColor = UIColor.black
    }
}
