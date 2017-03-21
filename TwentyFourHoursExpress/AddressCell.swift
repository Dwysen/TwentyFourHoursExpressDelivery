//
//  AddressCell.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {
    
    var heardView = UIView()
    var nameLabel = UILabel()
    var phoneLabel = UILabel()
    var addressLabel = UILabel()
    var editBtn : AddressBtn!
    var deleteBtn : AddressBtn!
    
    var accpetAddress:AcceptAddress? {
      
        didSet{
        nameLabel.text = accpetAddress?.toWhom
        phoneLabel.text = accpetAddress?.toWhomPhone
        addressLabel.text = accpetAddress?.toWhere
            
        }
    
    }
    
    var sendAddress:SendAddress? {
        
        didSet{
            nameLabel.text = sendAddress?.fromWhom
            phoneLabel.text = sendAddress?.fromWhomPhone
            addressLabel.text = sendAddress?.fromWhere
            
        }
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        addSubview(heardView)
        heardView.backgroundColor = BackScrollColor()
        
        addSubview(nameLabel)
    
        nameLabel.textAlignment = .left
        
        addSubview(phoneLabel)
  
        phoneLabel.textAlignment = .right
    
        addSubview(addressLabel)
        addressLabel.text = "北京大望路北京大望路北京大望路北京大望路北京大望路北京大望路北京大望路北京大望路北京大望路"
        addressLabel.textColor = TitleGrayColor()
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.numberOfLines = 0
        let attr = [NSFontAttributeName:addressLabel.font]
        let height = autoLabelHeight(with: addressLabel.text!, labelWidth: ScreenWidth - 20, attributes: attr)
        addressLabel.frame = CGRect(x: 10, y: 50, width: ScreenWidth - 20, height: height)
        
        editBtn = AddressBtn(frame:  CGRect(x: 0, y: 50 + height + 10 , width: ScreenWidth / 2, height: 50), type: "编辑")
//        editBtn.frame = CGRect(x: 0, y: 50 + height + 10 , width: ScreenWidth / 2, height: 50)
        editBtn.setTitle("编辑", for: .normal)
        editBtn.setTitleColor(TitleGrayColor(), for: .normal)
        addSubview(editBtn)
        
        
       
        deleteBtn = AddressBtn(frame: CGRect(x: ScreenWidth / 2, y: editBtn.y, width: ScreenWidth / 2, height: 50), type: "删除")
//        deleteBtn.frame = CGRect(x: ScreenWidth / 2, y: editBtn.y, width: ScreenWidth / 2, height: 50)
        deleteBtn.setTitle("删除", for: .normal)
        deleteBtn.setTitleColor(TitleGrayColor(), for: .normal)
        addSubview(deleteBtn)
        
    }
    
    override func layoutSubviews() {
        heardView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 10)
        nameLabel.frame = CGRect(x: 10, y: 20, width: 100, height: 20)
        phoneLabel.frame = CGRect(x: ScreenWidth - 170 , y: 20, width: 150, height: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
