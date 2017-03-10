//
//  ExpressCell.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/6.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class ExpressCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupUI()
    }
    
    private func setupUI(){
        
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        iconView.backgroundColor = UIColor.orange
        addSubview(iconView)
        
        let IDLabel = UILabel(frame: CGRect(x: height, y: 10, width: width - height, height: 20))
        IDLabel.text = "666666666666666666"
        IDLabel.textAlignment = .center
        addSubview(IDLabel)
        
        let subTitle = UILabel(frame: CGRect(x: height + 10, y: 40, width: width - height - 20, height: 50))
        subTitle.numberOfLines = 0
        subTitle.text = "北京市朝阳区大望路SOHO现代城2901" + "快递被签收"
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 15)
        subTitle.textColor = TitleGrayColor()
        addSubview(subTitle)
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
