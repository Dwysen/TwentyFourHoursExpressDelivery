//
//  MeCell.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class MeCell: UITableViewCell {

    fileprivate lazy var iconImageView = UIImageView()
    fileprivate lazy var titleLabel = UILabel()
    fileprivate lazy var arrowView = UIImageView()
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(iconImageView)
//        
//        titleLabel.textColor = UIColor.black
//        titleLabel.font = UIFont.systemFont(ofSize: 13)
//        titleLabel.alpha = 0.8
//        contentView.addSubview(titleLabel)
        
//        bottomLine.backgroundColor = UIColor.gray
//        bottomLine.alpha = 0.15
//        contentView.addSubview(bottomLine)
        
        arrowView.image = UIImage(named: "icon_go")
        contentView.addSubview(arrowView)
        
        selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        arrowView.frame = CGRect(x: width - 20, y: (height - (arrowView.image?.size.height)!) * 0.5, width: (arrowView.image?.size.width)!, height: (arrowView.image?.size.height)!)
        
//        let rightMargin: CGFloat = 10
//        let iconWH: CGFloat = 20
//        
//        iconImageView.frame = CGRect(x: rightMargin, y: (height - iconWH) * 0.5, width: iconWH, height: iconWH)
//        titleLabel.frame = CGRect(x: iconImageView.frame.maxX + rightMargin, y: 0, width: 200, height: height)
        
        
//        let leftMarge: CGFloat = 20
//        bottomLine.frame = CGRect(x: leftMarge, y: height - 0.5, width: width - leftMarge, height: 0.5)
    }


}
