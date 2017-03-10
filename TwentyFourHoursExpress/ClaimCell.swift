//
//  ClaimCell.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class ClaimCell: UITableViewCell {
    
    private var companyLabel = UILabel()
    private var IDLabel = UILabel()
    private var logisticalLabel = UILabel()
    private var timeLabel = UILabel()
    private var expressTypeLabel = UILabel()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(companyLabel)
        companyLabel.text = "申通快递"
        
        addSubview(IDLabel)
        IDLabel.text = "12345678901234"
        
        addSubview(logisticalLabel)
        logisticalLabel.text = "快递已到达【北京昌平公司】,扫描员汪涵"
        
        addSubview(timeLabel)
        timeLabel.text = "2017-03-09 10:00:00"
        
        addSubview(expressTypeLabel)
        expressTypeLabel.text = "快递类型【书】"
        
        
    }
    
    override func layoutSubviews() {
        
        companyLabel.frame = CGRect(x: 10, y: 10, width: 80, height: 10)
        
        IDLabel.frame = CGRect(x: 10 + 120, y: 10, width: 120, height: 10)
        
        logisticalLabel.frame = CGRect(x: 10, y: IDLabel., width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
