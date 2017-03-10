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
        buildView(View: passwordView, imageName: "identifyCode", placeholder: "请输入验证码")
        
        let loginBtn = UIButton(frame: CGRect(x: 10, y: 130, width: ScreenWidth - 20, height: 50))
        loginBtn.backgroundColor = TFColor(204, g: 204, b: 204, a: 1)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        view.addSubview(loginBtn)
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
            LoginTextFld = TextFld
            
        }
        
        if placeholder == "请输入验证码" {
            
            let getIdentifyCodeBtn = UIButton(frame: CGRect(x: View.width - 80, y: 15, width: 75, height: 20))
            getIdentifyCodeBtn.layer.cornerRadius = 5
            getIdentifyCodeBtn.layer.masksToBounds = true
            getIdentifyCodeBtn.setTitle("点击获取", for: .normal)
            getIdentifyCodeBtn.setTitleColor(UIColor.white, for: .normal)
            getIdentifyCodeBtn.backgroundColor = GreenColor()
            getIdentifyCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            View.addSubview(getIdentifyCodeBtn)
            
        }
        
        view.addSubview(View)
        
        
    }
    
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
        
    }

    

}
