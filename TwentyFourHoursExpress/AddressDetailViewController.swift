//
//  AddressDetailViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class AddressDetailViewController: UIViewController {

    private var phoneField:UITextField!
    private var addressField:UITextField!
    private var nameField:UITextField!
    
    var placeholderLabel:UILabel!
    
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
        
        let addressView = UITextView(frame: CGRect(x: 10, y: 10  + 100, width: ScreenWidth, height: 200))
        addressView.font = UIFont.systemFont(ofSize: 13)
        addressView.textColor = TitleGrayColor()
        addressView.delegate = self
        view.addSubview(addressView)
        
        placeholderLabel = UILabel(frame: CGRect(x: 10, y: addressView.y, width: ScreenWidth - 20 , height: 20))
        placeholderLabel.textAlignment = .left
        placeholderLabel.font = UIFont.systemFont(ofSize: 15)
        placeholderLabel.textColor = TitleGrayColor()
        placeholderLabel.text = "请输入地址"
        view.addSubview(placeholderLabel)
        
        
       
    }

    func save(){
       _ = navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func buildInputView(view:UIView,title:String,placeholder:String){
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 80, height: 24))
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.text = title
        view.addSubview(titleLabel)
        
        let textField = UITextField(frame: CGRect(x: 110 , y: 10, width:ScreenWidth - 110 - 70 , height: 24))
        textField.placeholder = placeholder
        view.addSubview(textField)
        
        if title == "姓名"{
            nameField = textField
        }
        if title == "电话"{
            phoneField = textField
        }
        if title == "地址"{
            addressField = textField
        }
        
        
        
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
