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
        

        // Do any additional setup after loading the view.
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
        
        let LoginOutBtn = UIButton(frame: CGRect(x: 0, y: ScreenHeight - 50, width: ScreenWidth, height: 50))
        LoginOutBtn.setTitle("退出登录", for: .normal)
        LoginOutBtn.setTitleColor(UIColor.white, for: .normal)
        LoginOutBtn.backgroundColor = GreenColor()
        LoginOutBtn.addTarget(self, action: #selector(clickLoginOutBtn), for: .touchUpInside)
        view.addSubview(LoginOutBtn)
        
    }
    
    func clickLoginOutBtn(){
    
        print("退出登录")
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
