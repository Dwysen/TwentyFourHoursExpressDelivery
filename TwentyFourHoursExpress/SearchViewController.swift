//
//  SearchViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/6.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: contentViewHeight)
        view.backgroundColor = UIColor.white
        
        let searchTextField = UITextField(frame: CGRect(x: 50, y: 30, width: ScreenWidth - 100, height: 30))
        searchTextField.placeholder = "请输入订单号查询"
        searchTextField.borderStyle = .roundedRect
        view.addSubview(searchTextField)
        
        
        let queryBtn = UIButton(frame: CGRect(x: ScreenWidth / 2 - 50, y: 100, width: 100, height: 30))
        
        queryBtn.setTitle("查询", for: .normal)
        queryBtn.backgroundColor = OrangeColor()
        queryBtn.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(queryBtn)
        
        queryBtn.addTarget(self, action: #selector(clickQueryBtn), for: .touchUpInside)
        
        

        // Do any additional setup after loading the view.
    }

    func clickQueryBtn(){
        
        let vc = LogisticalDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
