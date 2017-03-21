//
//  AddressBtn.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class AddressBtn: UIButton {

    override func layoutSubviews() {
        imageView?.x = width / 2 - 30
        imageView?.y = 10
        imageView?.width = 30
        imageView?.height = 30
        
        titleLabel?.x = width / 2 
        titleLabel?.y = 10
        titleLabel?.width = 60
        titleLabel?.height = 30
    }
    
     init(frame: CGRect,type:String) {
        super.init(frame: frame)
//        imageView?.backgroundColor = UIColor.orange
        imageView?.image = UIImage(named: type)
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
//        titleLabel?.text = type
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
