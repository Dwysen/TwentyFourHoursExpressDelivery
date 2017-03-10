//
//  AboutUsViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BackScrollColor()
        title = "关于我们"
        
        setupUI()

        
        // Do any additional setup after loading the view.
    }

    private func setupUI(){
        
        let LogoView = UIImageView(frame: CGRect(x: ScreenWidth / 2 - 90, y: 20, width: 180, height: 50))
        LogoView.image = UIImage(named: "logo")
        view.addSubview(LogoView)
        
        let introduceTextView = UITextView(frame: CGRect(x: 10, y: 20 + 50 + 30 , width: ScreenWidth - 20, height: 300))
        introduceTextView.isEditable = false
        introduceTextView.backgroundColor = BackScrollColor()
        introduceTextView.text = "24小时快递服商是新闻集团旗下品牌之一，做为国内首家先行赔付快递服务商，依托新闻集团优势资源，通过互联网、移动互联网、物联网，构建出涵盖云计算中心、前端打包、网点分流三位一体的一站式快递服务平台,为快递行业开启全新模式下的新格局。                                            24小时快递服商是新闻集团旗下品牌之一，做为国内首家先行赔付快递服务商，依托新闻集团优势资源，通过互联网、移动互联网、物联网，构建出涵盖云计算中心、前端打包、网点分流三位一体的一站式快递服务平台,为快递行业开启全新模式下的新格局。"
        introduceTextView.font = UIFont.systemFont(ofSize: 15)
        introduceTextView.textColor = TitleGrayColor()
        view.addSubview(introduceTextView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
