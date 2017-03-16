//
//  ClaimViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class ClaimViewController: UIViewController {

    private var searchBar:UISearchBar!
    private var backImageView:UIImageView!
    private var intruduceLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
     
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    func setupUI(){
    
        backImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 232))
        backImageView.image = UIImage(named: "claimBackground")
        
        
        view.addSubview(backImageView)
        
        
        
        //        let tmpView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth - 20, height: 38))
        //        tmpView.backgroundColor = UIColor.white
        ////        tmpView.layer.masksToBounds = true
        ////        tmpView.layer.cornerRadius = 6
        ////        tmpView.layer.borderColor = UIColor(red: 100 / 255.0, green: 100 / 255.0, blue: 100 / 255.0, alpha: 1).cgColor
        ////        tmpView.layer.borderWidth = 0.2
        //        let image = UIImage.createImageFromView(tmpView)
        //
        //        //搜索商品
        //        searchBar = UISearchBar(frame:CGRect(x: 10, y: 170, width: ScreenWidth - 20 , height: 40))
        //        searchBar.placeholder = "请输入商品名称"
        //        searchBar.barTintColor = UIColor.white
        //        searchBar.keyboardType = UIKeyboardType.default
        //        searchBar.setSearchFieldBackgroundImage(image, for: UIControlState())
        //        backImageView.addSubview(searchBar)
        
        let claimBtn = UIButton(frame: CGRect(x: ScreenWidth / 2 - 37.5, y: 195, width: 75, height: 75))
        claimBtn.setTitle("理 赔", for: .normal)
        claimBtn.layer.cornerRadius = 37.5
        claimBtn.layer.masksToBounds = true
        claimBtn.setTitleColor(UIColor.white, for: .normal)
        claimBtn.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        claimBtn.backgroundColor = OrangeColor()
        
        view.addSubview(claimBtn)
        view.bringSubview(toFront: claimBtn)
        claimBtn.isUserInteractionEnabled = true
        
        view.bringSubview(toFront: claimBtn)
        
        claimBtn.addTarget(self, action: #selector(clickClaimBtn), for: .touchUpInside)
        
        
        let introduceView = UIView()
        
        introduceView.layer.borderWidth = 2
        introduceView.layer.borderColor = GreenColor().cgColor
        introduceView.layer.cornerRadius = 5
        introduceView.layer.masksToBounds = true
        view.addSubview(introduceView)
        
        
        intruduceLabel.text = "24小时快递服商是新闻集团旗下品牌之一，做为国内首家先行赔付快递服务商，依托新闻集团优势资源，通过互联网、移动互联网、物联网，构建出涵盖云计算中心、前端打包、网点分流三位一体的一站式快递服务平台,为快递行业开启全新模式下的新格局。"
        intruduceLabel.numberOfLines = 0
        intruduceLabel.font = UIFont.systemFont(ofSize: 15)
        intruduceLabel.textColor = TitleGrayColor()
        let labelWidth = ScreenWidth - 80
        let height = autoLabelHeight(with: intruduceLabel.text!, labelWidth: labelWidth, attributes: [NSFontAttributeName:intruduceLabel.font])
        
        
        intruduceLabel.frame = CGRect(x: 40, y: 255 + 50 , width: labelWidth , height: height)
        introduceView.frame = CGRect(x: 30, y: 255 + 40, width: labelWidth + 20, height: height + 20)
        
        view.addSubview(intruduceLabel)
    
    }
    
    func clickClaimBtn(){
        
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        print( isLogin )
        
     
        guard UserDefaults.standard.bool(forKey: "isLogin") else {
            showErrorWithTitle(title: "请登录", autoCloseTime: 0.5)
            return
        }
        
    
        
        let vc = ClaimTabieViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
