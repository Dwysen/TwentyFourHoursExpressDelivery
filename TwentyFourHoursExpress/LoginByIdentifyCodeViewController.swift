//
//  LoginByIdentifyCodeViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class LoginByIdentifyCodeViewController: UIViewController {
    
    private var cleanBtn:UIButton!
    private var LoginTextFld:UITextField!
    private var IdentifyTextFld:UITextField!
    
    private var IdentifyCodeIsRight = false
    private var LoginNumOK = false
    
    private var getIdentifyCodeBtn:UIButton!
    private var loginBtn : UIButton!
    
    private var identifyCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupUI(){
        
        let loginWithPhoneView = UIView(frame: CGRect(x: 10, y: 10, width: ScreenWidth - 20, height: 50))
        
        buildView(View: loginWithPhoneView, imageName: "phone", placeholder: "请输入手机号")
        
        let passwordView = UIView(frame: CGRect(x: 10, y: 70, width: ScreenWidth - 20, height: 50))
        buildView(View: passwordView, imageName: "identifyCode", placeholder: "请输入验证码")
        
        loginBtn = UIButton(frame: CGRect(x: 10, y: 130, width: ScreenWidth - 20, height: 50))
        loginBtn.backgroundColor = BtnGrayColor()
        loginBtn.isEnabled = false
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        view.addSubview(loginBtn)
        
        loginBtn.addTarget(self, action: #selector(Login), for: .touchUpInside)
    }
    
    
    func Login(){
    
        guard IdentifyTextFld.text == identifyCode else {
            showErrorWithTitle(title: "验证码错误", autoCloseTime: 0.5)
            return
        }
        
        TFNetworkTool.LoginWithIdentify(phone: LoginTextFld.text!, code: IdentifyTextFld.text!) { (response) in
            
            //登录成功
          
                DispatchQueue.main.async {
                    self.showRightWithTitle(title: "登录成功", autoCloseTime: 0.5)
                    let vc = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! MeViewController
                    vc.headTopView.nameLabel.text = self.LoginTextFld.text!
                    vc.headTopView.iconButton.isEnabled = false
                    
                    
                    let token = response["token"]
                    UserDefaults.standard.set(self.LoginTextFld.text, forKey: "phone")
                    //缓存token
                    UserDefaults.standard.set(token, forKey: "token")
                    UserDefaults.standard.set(true, forKey: "isLogin")
                    
                    _ = self.navigationController?.popViewController(animated: true)
                }
            
            }
        
        
        
        
    
    }
    
    func buildView(View:UIView,imageName:String,placeholder:String){
        
        View.backgroundColor = UIColor.white
        View.layer.cornerRadius = 5
        View.layer.masksToBounds = true
        
        let IconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        IconView.image = UIImage(named: imageName)
        View.addSubview(IconView)
        
        let lineView = UIView(frame: CGRect(x: 50, y: 10, width: 1, height: 30))
        lineView.backgroundColor = BackScrollColor()
        View.addSubview(lineView)
        
        let TextFld = UITextField(frame: CGRect(x: 60, y: 10, width: 200, height: 30))
        TextFld.placeholder = placeholder
        TextFld.addTarget(self, action: #selector(textFldDidChange(sender:)), for: .editingChanged)
        View.addSubview(TextFld)
        
        if placeholder == "请输入手机号" {
            
            let Btn = UIButton(frame: CGRect(x: View.width - 40, y: 10, width: 30, height: 30))
            Btn.setImage(UIImage(named:"cleanLogin"), for: .normal)
            View.addSubview(Btn)
            Btn.isHidden = true
            Btn.addTarget(self, action: #selector(clickCleanBtn), for: .touchUpInside)
            
            cleanBtn = Btn
            TextFld.tag = 1
            LoginTextFld = TextFld
            
            
        }
        
        if placeholder == "请输入验证码" {
            getIdentifyCodeBtn = UIButton(frame: CGRect(x: View.width - 80, y: 15, width: 75, height: 20))
            getIdentifyCodeBtn.layer.cornerRadius = 5
            getIdentifyCodeBtn.layer.masksToBounds = true
            getIdentifyCodeBtn.setTitle("点击获取", for: .normal)
            getIdentifyCodeBtn.setTitleColor(UIColor.white, for: .normal)
            getIdentifyCodeBtn.backgroundColor = GreenColor()
            getIdentifyCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            View.addSubview(getIdentifyCodeBtn)
            
            getIdentifyCodeBtn.addTarget(self, action: #selector(clickGetIdentifyCodeBtn), for: .touchUpInside)
            
            TextFld.tag = 2
            IdentifyTextFld = TextFld
            
            
        }
        
        view.addSubview(View)
        
        
    }
    // 获取验证码
    func clickGetIdentifyCodeBtn(){
        
        let isPhone = Validate.phoneNum(LoginTextFld.text!).isRight
        
        guard isPhone else {
            showErrorWithTitle(title: "手机格式错误", autoCloseTime: 0.5)
            return
        }
        
        TFNetworkTool.getIdentifyCode(phone: LoginTextFld.text!, finished: { (status, code) in
            
            if status == 200 {
                
                self.identifyCode = code
                
            }
        })
    }
    // 清除登录框
    func clickCleanBtn(){
        
        LoginTextFld.text = ""
        cleanBtn.isHidden = true
        
    }
    
    func textFldDidChange(sender:UITextField){
        
        if sender.text == "" {
            cleanBtn.isHidden = true
        } else {
            cleanBtn.isHidden = false
        }
        
        // 登录判断
        if sender.tag == 1 {
            LoginNumOK = Validate.phoneNum(sender.text!).isRight
        }
        
        
        if sender.tag == 2 {
            
            let scan = Scanner(string: IdentifyTextFld.text!)
            var val:Int = 0
            let countIsRight = IdentifyTextFld.text?.characters.count == 6 ? true:false
            IdentifyCodeIsRight = scan.scanInt(&val) && scan.isAtEnd && countIsRight
            
        }
        
        if LoginNumOK && IdentifyCodeIsRight {
            loginBtn.backgroundColor = GreenColor()
            loginBtn.isEnabled = true
        } else {
            loginBtn.backgroundColor = BtnGrayColor()
            loginBtn.isEnabled = false
        }
        
        
        
    }

    

}
