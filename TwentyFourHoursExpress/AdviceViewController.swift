//
//  AdviceViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class AdviceViewController: UIViewController {

    var placeholderLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BackScrollColor()
 
        
        
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isTranslucent = false
    }

    func setupUI(){
    
        let adviceTextView = UITextView(frame: CGRect(x: 10, y: 10, width: ScreenWidth - 20, height: 300))
        adviceTextView.backgroundColor = UIColor.white
        adviceTextView.delegate = self
        view.addSubview(adviceTextView)
    
        placeholderLabel = UILabel(frame: CGRect(x: 15, y: 15, width: ScreenWidth - 20 , height: 20))
        placeholderLabel.textAlignment = .left
        placeholderLabel.font = UIFont.systemFont(ofSize: 15)
        placeholderLabel.textColor = TitleGrayColor()
        placeholderLabel.text = "请告诉我们您的建议"
        view.addSubview(placeholderLabel)
        
        let commitBtn = UIButton(frame: CGRect(x: 10, y: 310 + 30, width: ScreenWidth - 20, height: 50))
        commitBtn.layer.cornerRadius = 5
        commitBtn.layer.masksToBounds = true
        commitBtn.setTitle("提 交", for: .normal)
        commitBtn.setTitleColor(UIColor.white, for: .normal)
        commitBtn.backgroundColor = GreenColor()
        commitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(commitBtn)
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension AdviceViewController:UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
    
    
}
