//
//  AddressDetailViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

protocol AddressProtocol {
    
    func passAcceptAddress(address:AcceptAddress)
    
    func passSendAddress(address:SendAddress)
}

class AddressDetailViewController: UIViewController {

    var phoneField = UITextField()
    var addressView = UITextView()
    var nameField = UITextField()
    
    var sendOrAccept = ""
    var type = ""
    
    var delegate:AddressProtocol?
    
    var placeholderLabel = UILabel()
    
    var editAccpetAddress:AcceptAddress?
        {
        didSet{
            phoneField.text = editAccpetAddress?.toWhomPhone
            nameField.text = editAccpetAddress?.toWhom
            addressView.text = editAccpetAddress?.toWhere
            placeholderLabel.isHidden = true
              }
        }
    
    var editSendAddress:SendAddress?
        {
        didSet{
            phoneField.text = editSendAddress?.fromWhomPhone
            nameField.text = editSendAddress?.fromWhom
            addressView.text = editSendAddress?.fromWhere
            placeholderLabel.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let saveBtn = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem = saveBtn
        
        let topLineView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10))
        topLineView.backgroundColor = BackScrollColor()
        view.addSubview(topLineView)
        
        let nameView = UIView(frame: CGRect(x: 0, y: 10 , width: ScreenWidth, height: 50))
        buildInputView(view: nameView, title: "姓名", placeholder: "请输入姓名")
        view.addSubview(nameView)
        
        //寄件人
        let phoneView = UIView(frame: CGRect(x: 0, y:10 + 50, width: ScreenWidth, height: 50))
        buildInputView(view: phoneView, title: "电话", placeholder: "请输入电话")
        view.addSubview(phoneView)
        
        addressView.frame = CGRect(x: 10, y: 10  + 100, width: ScreenWidth, height: 200)
        addressView.font = UIFont.systemFont(ofSize: 13)
        addressView.textColor = TitleGrayColor()
        addressView.delegate = self
        view.addSubview(addressView)
        
        placeholderLabel.frame = CGRect(x: 10, y: addressView.y, width: ScreenWidth - 20 , height: 20)
        placeholderLabel.textAlignment = .left
        placeholderLabel.font = UIFont.systemFont(ofSize: 15)
        placeholderLabel.textColor = TitleGrayColor()
        placeholderLabel.text = "请输入地址"
        view.addSubview(placeholderLabel)
        
    }
    
    deinit {
        print("AddressDetailViewController release")
    }

    func save(){
        
        guard Validate.phoneNum(phoneField.text!).isRight else {
            showErrorWithTitle(title: "号码格式错误", autoCloseTime: 0.5)
            return
        }
        
        guard addressView.text != "" else {
            showErrorWithTitle(title: "请填写地址", autoCloseTime: 0.5)
            return
        }
        
        // 更新收件人地址
        
        if sendOrAccept == "Accept" {
        
        let address = AcceptAddress(id: editAccpetAddress!.id, toWhere: addressView.text, toWhom: nameField.text!, toWhomPhone: phoneField.text!)
        
        switch type {
        case "Add":
              break
        case "Edit":
            
            TFNetworkTool.editAcceptAddress(acceptAddress: address, finished: { (status) in
                if status == 200 {
                
                    DispatchQueue.main.async {
                      
                        self.delegate?.passAcceptAddress(address: address)
                        _ = self.navigationController?.popViewController(animated: true)
                        self.showRightWithTitle(title: "更新地址成功", autoCloseTime: 1)
                        
                    }
                    
                    
                } else {
                  
                    DispatchQueue.main.async {
                        self.showErrorWithTitle(title: "更新失败", autoCloseTime: 0.5)
                        _ = self.navigationController?.popViewController(animated: true)
                    }
                    
                    
                }
                
            })
            
        default:
            break
        }
        
     
        }
        
        // 更新寄件地址
        
        if sendOrAccept == "Send" {
            
            let address = SendAddress(id: editSendAddress!.id, fromWhere: addressView.text, fromWhom: nameField.text!, fromWhomPhone: phoneField.text!)
            
            switch type {
            case "Add":
                break
            case "Edit":
                
                TFNetworkTool.editSendAddress(sendAddress: address, finished: { (status) in
                    if status == 200 {
                        
                        DispatchQueue.main.async {
                            
                            self.delegate?.passSendAddress(address: address)
                            _ = self.navigationController?.popViewController(animated: true)
                            self.showRightWithTitle(title: "更新地址成功", autoCloseTime: 1)
                            
                        }
                        
                        
                    } else {
                        
                        DispatchQueue.main.async {
                            self.showErrorWithTitle(title: "更新失败", autoCloseTime: 0.5)
                            _ = self.navigationController?.popViewController(animated: true)
                        }
                        
                        
                    }
                    
                })
                
            default:
                break
            }
            
            
        }
        
    
   
    }
    
 
    private func buildInputView(view:UIView,title:String,placeholder:String){
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 80, height: 24))
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.text = title
        view.addSubview(titleLabel)
        
//        let textField = UITextField(frame: CGRect(x: 110 , y: 10, width:ScreenWidth - 110 - 70 , height: 24))
//        textField.placeholder = placeholder
//        view.addSubview(textField)
        
        if title == "姓名"{
            nameField.frame = CGRect(x: 110 , y: 10, width:ScreenWidth - 110 - 70 , height: 24)
            nameField.placeholder = placeholder
            view.addSubview(nameField)
        }
        if title == "电话"{
            phoneField.frame = CGRect(x: 110 , y: 10, width:ScreenWidth - 110 - 70 , height: 24)
            phoneField.placeholder = placeholder
            view.addSubview(phoneField)
        }
//        if title == "地址"{
//            addressTextView = textField
//        }
        
        
        
        let borderLineView = UIView(frame:CGRect(x: 10, y: 43.5, width: ScreenWidth - 20, height: 1))
        borderLineView.backgroundColor = BackScrollColor()
        view.addSubview(borderLineView)
        
    }

    
}

extension AddressDetailViewController:UITextViewDelegate {
  
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
}
