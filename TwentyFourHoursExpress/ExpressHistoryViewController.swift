//
//  ExpressHistoryViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class ExpressHistoryViewController: UIViewController {

    private var BackgroundImageView:UIImageView!
    private var BackgroundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: contentViewHeight)
        view.backgroundColor = UIColor.white
        
        BackgroundImageView = UIImageView(frame:CGRect(x: ScreenWidth / 2 - 50, y: 20, width: 100, height: 100))
        BackgroundImageView.image = UIImage(named: "ExpressHistoryBackground")
        view.addSubview(BackgroundImageView)
        
        BackgroundLabel = UILabel(frame: CGRect(x: 10, y: 120, width: ScreenWidth - 20, height: 20))
        BackgroundLabel.textAlignment = .center
        BackgroundLabel.font = UIFont.systemFont(ofSize: 13)
        BackgroundLabel.textColor = TFColor(85, g: 85, b: 85, a: 1)
        BackgroundLabel.text = "无最新寄出的快递和收到的快递"
        view.addSubview(BackgroundLabel)
        

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
