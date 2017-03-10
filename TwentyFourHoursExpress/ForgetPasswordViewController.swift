//
//  ForgetPasswordViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    private var phoneTextFid:UITextField!
    private var messageTextFid:UITextField!
    private var passwordTextFid:UITextField!
    private var ensurePasswordTextFid:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        
        title = "找回密码"
        
        view.backgroundColor = BackScrollColor()
        
        let placeholderArr = ["请输入手机号","请输入短信验证码","6-16位字符","6-16位字符,两次密码一致"]
        
        for i in 0..<4 {
            
            let registerView = UIView(frame: CGRect(x: 0, y: CGFloat(i) * 44, width: ScreenWidth, height: 44))
            buildView(view: registerView, placeholder: placeholderArr[i])
            view.addSubview(registerView)
            
        }
        
        let ensureBtn = UIButton(frame: CGRect(x: 10, y: 176 + 10 , width: ScreenWidth - 20, height: 50))
        ensureBtn.backgroundColor = TFColor(204, g: 204, b: 204, a: 1)
        ensureBtn.setTitleColor(UIColor.white, for: .normal)
        ensureBtn.setTitle("确定", for: .normal)
        ensureBtn.layer.cornerRadius = 5
        ensureBtn.layer.masksToBounds = true
        view.addSubview(ensureBtn)
        
    }
    
    private func buildView(view:UIView,placeholder:String){
        
        view.backgroundColor = UIColor.white
        
        let iconImageView = UIImageView(frame: CGRect(x: 20, y: 10, width: 24, height: 24))
        
        view.addSubview(iconImageView)
        
        let textFid = UITextField(frame: CGRect(x: 54, y: 10, width: 250, height: 24))
        textFid.placeholder = placeholder
        view.addSubview(textFid)
        
        switch placeholder {
        case "请输入手机号":
            phoneTextFid = textFid
            iconImageView.image = UIImage(named:"phone")
        case "请输入短信验证码":
            messageTextFid = textFid
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
            passwordTextFid = textFid
            iconImageView.image = UIImage(named:"password")
        default:
            ensurePasswordTextFid = textFid
            iconImageView.image = UIImage(named:"repeatPassword")
        }
    }

    func clickGetIdentifyCodeBtn(){
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
