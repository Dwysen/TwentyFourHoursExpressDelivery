//
//  SettingViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isHidden = true 
        
        view.backgroundColor = BackScrollColor()
        title = "设置"
        setupUI()

    }
    
    func setupUI(){
    
        let aboutUsView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 44))
        buildView(view:aboutUsView,title:"关于我们",rightSubtitle:false)
        view.addSubview(aboutUsView)
        
        let tapAboutUsGR = UITapGestureRecognizer(target: self, action: #selector(tapAboutUs))
        aboutUsView.addGestureRecognizer(tapAboutUsGR)
        
        let lineView = UIView(frame: CGRect(x: 44, y: 43.5, width: ScreenWidth - 44 - 10, height: 1))
        lineView.backgroundColor = BackScrollColor()
        view.addSubview(lineView)
        
        let versionView = UIView(frame: CGRect(x: 0, y: 44, width: ScreenWidth, height: 44))
        buildView(view: versionView, title: "版本信息", rightSubtitle: true)
        view.addSubview(versionView)
        
        guard UserDefaults.standard.bool(forKey: "isLogin") else {
            //            LoginOutBtn.isHidden = true
            return
        }
        
        let LoginOutBtn = UIButton(frame: CGRect(x: 0, y: ScreenHeight - 50 - navigationH, width: ScreenWidth, height: 50))
        LoginOutBtn.setTitle("退出登录", for: .normal)
        LoginOutBtn.setTitleColor(UIColor.white, for: .normal)
        LoginOutBtn.backgroundColor = GreenColor()
        LoginOutBtn.addTarget(self, action: #selector(clickLoginOutBtn), for: .touchUpInside)
        
        view.addSubview(LoginOutBtn)
        
    }
    
    func clickLoginOutBtn(){
    
        print("退出登录")
        UserDefaults.standard.removeObject(forKey: "phone")
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.set(false, forKey: "isLogin")
    
        let vc = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! MeViewController
        vc.headTopView.nameLabel.text = "点击登录"
        vc.headTopView.iconButton.isEnabled = true
        _ = navigationController?.popViewController(animated: true)
        
    }

    private func buildView(view:UIView,title:String,rightSubtitle:Bool){
        
        view.backgroundColor = UIColor.white
        
        let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
        
        view.addSubview(iconView)
        
        let titleLabel = UILabel(frame: CGRect(x: 44, y: 10, width: 100, height: 24))
        titleLabel.text = title
        titleLabel.textAlignment = .left
        view.addSubview(titleLabel)
        
        if title == "关于我们" {
        iconView.image = UIImage(named: "aboutUs")
        }
        
        if title == "版本信息" {
        iconView.image = UIImage(named: "version")
        }
        
        if rightSubtitle {
            
         let versionLabel = UILabel(frame: CGRect(x: ScreenWidth - 110, y: 10, width: 100 , height: 24))
            versionLabel.text = "v1.00"
            versionLabel.textAlignment = .right
            versionLabel.textColor = TitleGrayColor()
            view.addSubview(versionLabel)
        }
 
    }
    
    func tapAboutUs(){
        
        let vc = AboutUsViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
 

}
