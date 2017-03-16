//
//  ClaimCell.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class ClaimCell: UITableViewCell {
    
    var companyLabel = UILabel()
    private var IDLabel = UILabel()
    var statusLabel = UILabel()
    private var logisticalLabel = UILabel()
    private var timeLabel = UILabel()
    private var expressTypeLabel = UILabel()
    var claimBtn = UIButton()
    
    var delivery:TFPersonDelivery?{
     
        didSet{
            companyLabel.text = delivery?.deliveryType
            IDLabel.text = delivery?.deliveryNum
            expressTypeLabel.text = delivery.debugDescription
            
        }
    
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(companyLabel)
        companyLabel.text = "申通快递"
        companyLabel.font = UIFont.systemFont(ofSize: 15)
        
        addSubview(IDLabel)
        IDLabel.text = "12345678901234"
        IDLabel.font = UIFont.systemFont(ofSize: 13)
        
        addSubview(statusLabel)
        statusLabel.text = "未签收"
        statusLabel.font = UIFont.systemFont(ofSize: 13)
        statusLabel.textColor = GreenColor()
        statusLabel.textAlignment = .center

        
        addSubview(logisticalLabel)
        logisticalLabel.text = "快递已到达【北京昌平公司】,扫描员汪涵"
        logisticalLabel.textColor = TitleGrayColor()
        logisticalLabel.font = UIFont.systemFont(ofSize: 11)
        
        addSubview(timeLabel)
        timeLabel.text = "2017-03-09 10:00:00"
        timeLabel.textColor = TitleGrayColor()
        timeLabel.font = UIFont.systemFont(ofSize: 11)
        
        
        addSubview(expressTypeLabel)
        expressTypeLabel.text = "快递类型【书】"
        expressTypeLabel.font = UIFont.systemFont(ofSize: 15)
        
        addSubview(claimBtn)
//        claimBtn.setImage(UIImage(named:"claim"), for: .normal) 
        claimBtn.setTitle("理赔", for: .normal)
        claimBtn.backgroundColor = OrangeColor()
        
        
        
    }
    
    override func layoutSubviews() {
        
        companyLabel.frame = CGRect(x: 10, y: 10, width: 50, height: 10)
        
        IDLabel.frame = CGRect(x: 60, y: 10, width: 120, height: 10)
        
        statusLabel.frame = CGRect(x: width - 60, y: 10, width: 50, height: 10)
        
        logisticalLabel.frame = CGRect(x: 10, y: IDLabel.maxY + 10, width: width - 130, height: 10)
        
        timeLabel.frame = CGRect(x: 10, y: logisticalLabel.maxY + 10, width: width - 130, height: 10)
        
        expressTypeLabel.frame = CGRect(x: 10, y: timeLabel.maxY + 10, width: 180, height: 10)
        
        claimBtn.frame = CGRect(x: width - 60, y: IDLabel.maxY + 20, width: 50, height: 50)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
