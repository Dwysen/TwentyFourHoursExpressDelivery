//
//  LogisticalCell.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class LogisticalCell: UITableViewCell {

    
    private var timeLabel = UILabel()
    private var detailLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let lineImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 10, height: height + 30))
        lineImageView.image = UIImage(named: "LogisticalLine")
        addSubview(lineImageView)
        
        timeLabel.frame = CGRect(x: 30, y: 0, width: ScreenWidth - 40, height: 15)
        timeLabel.text = "2017-02-24 19:31:05"
        timeLabel.textAlignment = .left
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        addSubview(timeLabel)
        
        detailLabel.frame = CGRect(x: 30, y: 20, width: ScreenWidth - 40, height: 20)
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .left
        detailLabel.font = UIFont.systemFont(ofSize: 15)
        detailLabel.text = "在XXX省XXX市XXX街道XXX办事处进行揽件扫描在XXX省XXX市XXX街道XXX办事处进行揽件扫描"
        
        addSubview(detailLabel)
         
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
