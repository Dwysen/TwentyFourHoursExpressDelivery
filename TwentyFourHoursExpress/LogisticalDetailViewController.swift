//
//  LogisticalDetailViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class LogisticalDetailViewController: UIViewController {

    private var iconView = UIImageView()
    private var companyLabel = UILabel()
    private var IDLabel = UILabel()
    private var timeLineTableView = UITableView()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tabBarController?.tabBar.isHidden = true
        
        
        setupTopView()
        
        setupTimeLineTableView()
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupTopView(){
        
        let topView = UIView(frame: CGRect(x: 0, y: navigationH, width: ScreenWidth, height: 95))
        view.addSubview(topView)
        
        
        iconView.frame = CGRect(x: 10, y: 10, width: 75, height: 75)
        iconView.backgroundColor = OrangeColor()
        
        topView.addSubview(iconView)
        
        companyLabel = UILabel(frame: CGRect(x: 100, y: 10, width: 100, height: 20))
        companyLabel.text = "中通快递"
        topView.addSubview(companyLabel)
        
        IDLabel = UILabel(frame: CGRect(x: 100, y: 40, width: 200, height: 20))
        IDLabel.text = "666666666666666"
        topView.addSubview(IDLabel)
        
    }
    
    func setupTimeLineTableView(){
    
        timeLineTableView.frame = CGRect(x: 10, y: navigationH + 95 + 10, width: ScreenWidth, height: ScreenHeight - navigationH - 105)
        
        
        
        timeLineTableView.dataSource = self
        timeLineTableView.delegate = self
        
        timeLineTableView.separatorStyle = .none
        
        view.addSubview(timeLineTableView)
    
    
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension LogisticalDetailViewController:UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  LogisticalCell()
        return cell
        
    }
    
    
    
}

extension LogisticalDetailViewController:UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let labelHeight = autoLabelHeight(with: "在XXX省XXX市XXX街道XXX办事处进行揽件扫描", labelWidth: ScreenWidth - 40, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)])
        
        return 20 + labelHeight + 30
        
    }
}

