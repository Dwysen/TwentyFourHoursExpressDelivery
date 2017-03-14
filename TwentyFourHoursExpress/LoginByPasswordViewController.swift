//
//  LoginByPasswordViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class LoginByPasswordViewController: UIViewController {
    
    private var cleanBtn:UIButton!
    
    private var LoginTextFld:UITextField!
    private var passwordTextFld:UITextField!
    
    private var loginBtn:UIButton!
    
    private var passwordOK = false
    private var loginNumOK = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI(){
        
        let loginWithPhoneView = UIView(frame: CGRect(x: 10, y: 10, width: ScreenWidth - 20, height: 50))
        buildView(View: loginWithPhoneView, imageName: "phone", placeholder: "请输入手机号")
        
        let passwordView = UIView(frame: CGRect(x: 10, y: 70, width: ScreenWidth - 20, height: 50))
        buildView(View: passwordView, imageName: "password", placeholder: "请输入密码")
        
        let Btn = UIButton(frame: CGRect(x: 10, y: 130, width: ScreenWidth - 20, height: 50))
        Btn.backgroundColor = BtnGrayColor()
        Btn.isEnabled = false
        Btn.setTitleColor(UIColor.white, for: .normal)
        Btn.setTitle("登录", for: .normal)
        Btn.layer.cornerRadius = 5
        Btn.layer.masksToBounds = true
        view.addSubview(Btn)
        
        loginBtn = Btn
        loginBtn.addTarget(self, action: #selector(Login), for: .touchUpInside)
        
        //记住密码按钮样式与地址按钮样式一样
        let rememberPasswordBtn = AddressBtn(frame: CGRect.init(x: 10, y: 180, width: 80, height: 30), type: "删除")
        rememberPasswordBtn.setTitle("记住密码", for: .normal)
        rememberPasswordBtn.setTitleColor(GreenColor(), for: .normal)
        view.addSubview(rememberPasswordBtn)
        
        let registerBtn = UIButton(frame: CGRect(x: ScreenWidth - 90, y: 180 + 10 , width: 80, height: 30))
        registerBtn.setTitle("注册账号", for: .normal)
        registerBtn.setTitleColor(GreenColor(), for: .normal)
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        registerBtn.addTarget(self, action: #selector(clickRegisterBtn), for: .touchUpInside)
        
        view.addSubview(registerBtn)
        
    }
    
    
    deinit {
        print("Login release")
    }
    
    
    func generateToken(sloat:String){
        
        let token = ("@" + LoginTextFld.text! + "#" + (passwordTextFld.text! + "$" + sloat).md5()).md5()
        //缓存token
        UserDefaults.standard.set(token, forKey: "token")
        
    }
    
    func Login(){

        TFNetworkTool.LoginWithURLSession(phone: LoginTextFld.text!, pwd: passwordTextFld.text!) {  (code, info, sloat) in
            
            //成功
            if code == 200 {
                
                DispatchQueue.main.async {
                    self.showRightWithTitle(title: info, autoCloseTime: 0.5)
                    let vc = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! MeViewController
                    vc.headTopView.nameLabel.text = "baibai"
                    
                    UserDefaults.standard.set(self.LoginTextFld.text, forKey: "phone")
                    self.generateToken(sloat: sloat)
                    _ = self.navigationController?.popViewController(animated: true)
                }
                
            }
            else {
                DispatchQueue.main.async {
                self.showErrorWithTitle(title: info, autoCloseTime: 0.5)
                }
            }
        }
    }
    
    func clickRegisterBtn(){
        
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
        
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
        
        //登录框
        
        let TextFld = UITextField(frame: CGRect(x: 60, y: 10, width: 200, height: 30))
        TextFld.placeholder = placeholder
        TextFld.addTarget(self, action: #selector(textFldDidChange(sender:)), for: .editingChanged)
        
        View.addSubview(TextFld)
        
        if placeholder == "请输入手机号" {
            
            // 清除输入的手机号
            let Btn = UIButton(frame: CGRect(x: View.width - 40, y: 10, width: 30, height: 30))
            Btn.setImage(UIImage(named:"cleanLogin"), for: .normal)
            View.addSubview(Btn)
            Btn.isHidden = true
            Btn.addTarget(self, action: #selector(clickCleanBtn), for: .touchUpInside)
            
            //清除登录框按钮
            cleanBtn = Btn
            
            //登录框
            LoginTextFld = TextFld
            LoginTextFld.tag = 1
            
        }
        
        if placeholder == "请输入密码" {
            
            let forgetPasswordBtn = UIButton(frame: CGRect(x: View.width - 80, y: 15, width: 75, height: 20))
            forgetPasswordBtn.layer.cornerRadius = 5
            forgetPasswordBtn.layer.masksToBounds = true
            forgetPasswordBtn.setTitle("忘记密码", for: .normal)
            forgetPasswordBtn.setTitleColor(UIColor.white, for: .normal)
            forgetPasswordBtn.backgroundColor = GreenColor()
            forgetPasswordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            forgetPasswordBtn.addTarget(self, action: #selector(clickForgetPassword), for: .touchUpInside)
            View.addSubview(forgetPasswordBtn)
            
            //密码框
            passwordTextFld = TextFld
            passwordTextFld.isSecureTextEntry = true
            passwordTextFld.tag = 2
            
            
        }
        
        view.addSubview(View)
        
    }
    
    func clickForgetPassword(){
        
        let vc = ForgetPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func clickCleanBtn(){
        
        LoginTextFld.text = ""
        cleanBtn.isHidden = true
        
    }
    
    func textFldDidChange(sender:UITextField){
        
        // 清除登录名按钮
        if sender.tag == 1 {
            if sender.text == "" {
                cleanBtn.isHidden = true
            } else {
                cleanBtn.isHidden = false
            }
        }
        
        // 登录判断
        if sender.tag == 1 {
            loginNumOK = Validate.phoneNum(sender.text!).isRight
        }
        
        if sender.tag == 2 {
            passwordOK = Validate.password(sender.text!).isRight
        }
        
        if loginNumOK && passwordOK {
            loginBtn.backgroundColor = GreenColor()
            loginBtn.isEnabled = true
        } else {
            loginBtn.backgroundColor = BtnGrayColor()
            loginBtn.isEnabled = false
        }
    }
}

