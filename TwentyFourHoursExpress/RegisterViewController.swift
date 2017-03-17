//
//  RegisterViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    private var phoneTextFid:UITextField!
    private var identifyTextFid:UITextField!
    private var passwordTextFid:UITextField!
    private var ensurePasswordTextFid:UITextField!
    private var ensureBtn:UIButton!
    
    private var phoneNumIsRight = false
    private var IdentifyCodeIsRight = false
    private var passwordIsRight = false
    private var ensurePasswordIsRight = false
    
    private var identifyCode = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupUI()

    }
    
    deinit {
        print("RegisterViewController deinit")
    }

    private func setupUI(){
        
        view.backgroundColor = BackScrollColor()
    
        let noteLabel = UILabel(frame: CGRect(x: 10, y: 15, width: ScreenWidth, height: 15))
        noteLabel.text = "该账号将与您的快件关联,请输入自己的电话号码"
        noteLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(noteLabel)
        
        
        let placeholderArr = ["请输入手机号","请输入短信验证码","6-16位字符","6-16位字符,两次密码一致"]
        
        for i in 0..<4 {
        
            let registerView = UIView(frame: CGRect(x: 0, y: 33 + CGFloat(i) * 44, width: ScreenWidth, height: 44))
            buildView(view: registerView, placeholder: placeholderArr[i])
            view.addSubview(registerView)
        
        }
   
        ensureBtn = UIButton(frame: CGRect(x: 10, y: 33 + 176 + 10 , width: ScreenWidth - 20, height: 50))
        ensureBtn.backgroundColor = BtnGrayColor()
        ensureBtn.isEnabled = false
        ensureBtn.setTitleColor(UIColor.white, for: .normal)
        ensureBtn.setTitle("确定", for: .normal)
        ensureBtn.layer.cornerRadius = 5
        ensureBtn.layer.masksToBounds = true
        ensureBtn.addTarget(self, action: #selector(clickEnsureBtn), for: .touchUpInside)
        view.addSubview(ensureBtn)
    }
    
    
 
    // 注册
    func clickEnsureBtn(){
     
        print(identifyCode)
        
        guard identifyTextFid.text == identifyCode else {
            showErrorWithTitle(title: "验证码错误", autoCloseTime: 0.5)
            return
        }
        
        TFNetworkTool.RegisterWithURLSession(phone: phoneTextFid.text!, pwd: passwordTextFid.text!,code:identifyCode) { [weak self] (code,info) in
            
            DispatchQueue.main.async {
                
                if code == 200 {
                    self?.showRightWithTitle(title: info, autoCloseTime: 1)
                    _ = self?.navigationController?.popViewController(animated: true)
                }
                    
                else {
                    self?.showErrorWithTitle(title: info, autoCloseTime: 0.5)
                }
                
            }
        }
    }
    
    private func buildView(view:UIView,placeholder:String){
        
        view.backgroundColor = UIColor.white
        
        let iconImageView = UIImageView(frame: CGRect(x: 20, y: 10, width: 24, height: 24))
       
        view.addSubview(iconImageView)
        
        let textFid = UITextField(frame: CGRect(x: 54, y: 10, width: 270, height: 24))
        textFid.placeholder = placeholder
        textFid.addTarget(self, action: #selector(textFldValueChange(sender:)), for: .editingChanged)
//        textFid.delegate = self
        view.addSubview(textFid)
        
        switch placeholder {
        case "请输入手机号":
            textFid.tag = 0
            phoneTextFid = textFid
            iconImageView.image = UIImage(named:"phone")
            
        case "请输入短信验证码":
            textFid.tag = 1
            identifyTextFid = textFid
            iconImageView.image = UIImage(named:"identifyCode")
            let getIdentifyCodeBtn = UIButton(frame: CGRect(x: view.width - 80, y: 15, width: 75, height: 20))
            getIdentifyCodeBtn.layer.cornerRadius = 5
            getIdentifyCodeBtn.layer.masksToBounds = true
            getIdentifyCodeBtn.setTitle("点击获取", for: .normal)
            getIdentifyCodeBtn.setTitleColor(UIColor.white, for: .normal)
            getIdentifyCodeBtn.backgroundColor = GreenColor()
            getIdentifyCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            getIdentifyCodeBtn.addTarget(self, action: #selector(clickGetIdentifyCodeBtn), for: .touchUpInside)
            
            view.addSubview(getIdentifyCodeBtn)

        case "6-16位字符":
            textFid.tag = 2
            textFid.isSecureTextEntry = true
            passwordTextFid = textFid
            iconImageView.image = UIImage(named:"password")
        default:
            textFid.tag = 3
            textFid.isSecureTextEntry = true
            ensurePasswordTextFid = textFid
            iconImageView.image = UIImage(named:"repeatPassword")
        }
    
    }
    
    func clickGetIdentifyCodeBtn(){
        
        let isPhone = Validate.phoneNum(phoneTextFid.text!).isRight
        
        guard isPhone else {
            showErrorWithTitle(title: "手机格式错误", autoCloseTime: 0.5)
            return
        }
        
        TFNetworkTool.getIdentifyCode(phone: phoneTextFid.text!, finished: { (status, code) in
            
            if status == 200 {
                
                self.identifyCode = code
                
            }
        })
    }
    
    func textFldValueChange(sender:UITextField){
    
        let text = sender.text
    
        switch sender.tag {
        //手机号
        case 0:
            phoneNumIsRight = Validate.phoneNum(text!).isRight
            
        //短信验证码
        case 1:
            let scan = Scanner(string: text!)
            var val:Int = 0
            let countIsRight = text?.characters.count == 6 ? true:false
            IdentifyCodeIsRight = scan.scanInt(&val) && scan.isAtEnd && countIsRight
            
        //密码
        case 2:
            passwordIsRight = Validate.password(text!).isRight
            
        //确认密码
        default:
            ensurePasswordIsRight = Validate.password(text!).isRight
            

        }
        //两次输入密码相同
        let passwordIsSame = passwordTextFid.text == ensurePasswordTextFid.text ? true:false
        
        if phoneNumIsRight && IdentifyCodeIsRight && passwordIsRight && ensurePasswordIsRight && passwordIsSame {
            
            ensureBtn.backgroundColor = GreenColor()
            ensureBtn.isEnabled = true
            
        } else {
        
            ensureBtn.backgroundColor = BtnGrayColor()
            ensureBtn.isEnabled = false
        
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//extension RegisterViewController:UITextFieldDelegate {
//    
//    textfie
//
//
//
//
//
//}
