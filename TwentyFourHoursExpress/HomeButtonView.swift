//
//  HomeButtonView.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class HomeButtonView: UIView {

    private var ImageView = UIImageView()
    private var titleLabel = UILabel()
    private var subTitleLabel = UILabel()
   
    override init(frame: CGRect) {
       
        super.init(frame: frame)
  
        addSubview(ImageView)
        ImageView.backgroundColor = UIColor.orange
        
        addSubview(titleLabel)
        titleLabel.text = "title"
        titleLabel.textAlignment = .center
        
        addSubview(subTitleLabel)
        subTitleLabel.text = "subtitle"
        subTitleLabel.textAlignment = .center
        
    }
    
    override func layoutSubviews() {
        
        ImageView.frame = CGRect(x: width / 2 - 12.5, y: 10, width: 25, height: 25)
        titleLabel.frame = CGRect(x: 0, y: 45, width: width, height: 10)
        subTitleLabel.frame = CGRect(x: 0, y: 60, width: width, height: 10)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
