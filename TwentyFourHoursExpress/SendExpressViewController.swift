//
//  SendExpressViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class SendExpressViewController: UIViewController {

    private let lineViewHeight:CGFloat = 5
    private let addressViewHeight:CGFloat = 200
    let addressFontSize:CGFloat = 15
    
    private var BackScrollView = UIScrollView()
    
    var sendViewTextView:UITextView!
    var acceptViewTextView:UITextView!
    
    var sendAddressView:UIView!
    var acceptAddressView:UIView!
    
    private var nameField:UITextField!
    private var weightField:UITextField!
     var typeLabel:UILabel!
     var timeLabel:UILabel!
     var companyLabel:UILabel!
    private var remarkTextField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
//        tabBarController?.tabBar.isTranslucent = false
      
        view.backgroundColor = UIColor.white
        setupUI()
        
    }

    func setupUI(){

        setupTopView()
        
        setupBottomView()
        
    }
    
    private func setupTopView(){
        
    
        BackScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - tabbarH - navigationH))
        BackScrollView.contentSize = CGSize(width: ScreenWidth, height: lineViewHeight * 2 + addressViewHeight + 314 + 30)
        view.addSubview(BackScrollView)
      
        
        
        // 顶部线
        let topLineView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: lineViewHeight))
        topLineView.backgroundColor = BackScrollColor()
        BackScrollView.addSubview(topLineView)
        
        let addressView = UIView(frame: CGRect(x: 0, y: lineViewHeight , width: ScreenWidth, height: addressViewHeight))
        BackScrollView.addSubview(addressView)
        
        //寄件人
        let sendView = UIView(frame: CGRect(x: 0, y:0, width: ScreenWidth, height: 100))
        bulidAddressView(view: sendView,title:"寄件人")
        addressView.addSubview(sendView)
        sendAddressView = sendView
        
        //分隔线
        let borderLineView = UIView(frame: CGRect(x: 10, y: 99.5, width: ScreenWidth - 20 , height: 1))
        borderLineView.backgroundColor = BackScrollColor()
        addressView.addSubview(borderLineView)
        //收件人
        let acceptView = UIView(frame: CGRect(x: 0, y: 100, width: ScreenWidth, height: 100))
        bulidAddressView(view: acceptView, title: "收件人")
        addressView.addSubview(acceptView)
        
        acceptAddressView = acceptView
        
        let middleLineView = UIView(frame: CGRect(x: 0, y: lineViewHeight + addressViewHeight, width: ScreenWidth, height: 5))
        middleLineView.backgroundColor = BackScrollColor()
        BackScrollView.addSubview(middleLineView)
    
    }
    
    private func bulidAddressView(view:UIView,title:String){
        
        let addressIconView = UIImageView(frame: CGRect(x: 10, y: 35, width: 30, height: 30))
        view.addSubview(addressIconView)

//        let titleLabel = UILabel(frame: CGRect(x: 50, y: 20, width: 40, height: 10))
//        titleLabel.text = title
//        view.addSubview(titleLabel)
        
        let textView = UITextView(frame: CGRect(x: 50, y: 10, width: ScreenWidth - 50 - 80, height: 80))
        textView.font = UIFont.systemFont(ofSize: addressFontSize)
        textView.text = "HaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHaHa"
//        textView.placeholder = title 
        view.addSubview(textView)
        
        let addressBtn = UIButton(frame:CGRect(x: ScreenWidth - 80, y: 40, width: 80, height: 20))
        addressBtn.setTitle("地址簿", for: .normal)
        addressBtn.setTitleColor(GreenColor(), for: .normal)
        view.addSubview(addressBtn)
        
        if title == "寄件人"{
            addressIconView.image = UIImage(named: "send")
            sendViewTextView = textView
            addressBtn.addTarget(self, action: #selector(clickSendAddressBtn), for: .touchUpInside)
        }
        if title == "收件人"{
            addressIconView.image = UIImage(named: "accept")
            acceptViewTextView = textView
            addressBtn.addTarget(self, action: #selector(clickAcceptAddressBtn), for: .touchUpInside)
            
        }
        
    }
    func clickSendAddressBtn(){
    
        let vc = AddressTableViewContriller()
        vc.delegate = self
        vc.type = "Send"
        navigationController?.pushViewController(vc, animated: true)
    
    }
    func clickAcceptAddressBtn(){
    
        let vc = AddressTableViewContriller()
        vc.delegate = self
        vc.type = "Accept"
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
    private func setupBottomView(){
    
        //订单信息
        let bottomView = UIView(frame:CGRect(x: 0, y: addressViewHeight + 2 * lineViewHeight, width: ScreenWidth, height: 324))
        BackScrollView.addSubview(bottomView)
        
        let nameInputView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 44))
        buildInputView(view:nameInputView,title:"物品名称",placeholder: "请输入物品名称",nessary:true,rightSubLabel: false)
        bottomView.addSubview(nameInputView)
        
        //寄件重量
        let weightInputView = UIView(frame: CGRect(x: 0, y: 44, width: ScreenWidth, height: 44))
        buildInputView(view: weightInputView, title: "物品重量", placeholder: "请输入包裹重量", nessary: false, rightSubLabel: true)
        bottomView.addSubview(weightInputView)
        
        //寄件类型
        let typeClickView = UIView(frame: CGRect(x: 0, y: 88, width: ScreenWidth, height: 44))
        buildClickView(view: typeClickView, title: "物品类型", subTitle: ">")
        let typeTap = UITapGestureRecognizer(target: self, action: #selector(tapType))
        typeClickView.addGestureRecognizer(typeTap)
        bottomView.addSubview(typeClickView)

        //取件时间
        let timeClickView = UIView(frame: CGRect(x: 0, y: 132, width: ScreenWidth, height: 44))
        buildClickView(view: timeClickView, title: "取件时间", subTitle: ">")
        let timeTap = UITapGestureRecognizer(target: self, action: #selector(tapTime))
        timeClickView.addGestureRecognizer(timeTap)
        bottomView.addSubview(timeClickView)
        //寄件公司
        let companyClickView = UIView(frame: CGRect(x: 0, y: 176, width: ScreenWidth, height: 44))
        buildClickView(view: companyClickView, title: "快递公司", subTitle: ">")
        let companyTap = UITapGestureRecognizer(target: self, action: #selector(tapCompany))
        companyClickView.addGestureRecognizer(companyTap)
        bottomView.addSubview(companyClickView)
        
        let remarkView = UIView(frame: CGRect(x: 0, y: 220, width: ScreenWidth, height: 44))
        buildInputView(view: remarkView, title: "备注信息", placeholder: "请输入备注信息", nessary: false, rightSubLabel: false)
        
        bottomView.addSubview(remarkView)
        
        
        let btn = UIButton(frame: CGRect(x: ScreenWidth / 2 - 75, y: 284, width: 150, height: 30))
            btn.setTitle("确定", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = GreenColor()
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(ensureBtnClick), for: .touchUpInside)
        bottomView.addSubview(btn)
  
    }
    
    
    
    private func buildInputView(view:UIView,title:String,placeholder:String,nessary:Bool,rightSubLabel:Bool){
        //必填
        if nessary {
        let nessaryLabel = UILabel(frame: CGRect(x: 10, y: 17, width: 10, height: 10))
        nessaryLabel.textColor = GreenColor()
        nessaryLabel.text = "*"
        nessaryLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(nessaryLabel)
        }
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 80, height: 24))
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.text = title
        view.addSubview(titleLabel)
        
        let textField = UITextField(frame: CGRect(x: 110 , y: 10, width:ScreenWidth - 110 - 70 , height: 24))
        textField.placeholder = placeholder
        view.addSubview(textField)
        
        if title == "物品名称"{
           nameField = textField
        }
        if title == "物品重量"{
           weightField = textField
        }
        if title == "备注信息"{
           remarkTextField = textField
        }
        
        
        if rightSubLabel {
        
            let SubLabel = UILabel(frame: CGRect(x: ScreenWidth - 50, y: 10, width: 40, height: 24))
            SubLabel.text = "(KG)"
            SubLabel.font = UIFont.systemFont(ofSize: 15)
            view.addSubview(SubLabel)
            
        }
        
        let borderLineView = UIView(frame:CGRect(x: 10, y: 43.5, width: ScreenWidth - 20, height: 1))
        borderLineView.backgroundColor = BackScrollColor()
        view.addSubview(borderLineView)
        
    }
    
    private func buildClickView(view:UIView,title:String,subTitle:String){
    
        //必填
        
        let nessaryLabel = UILabel(frame: CGRect(x: 10, y: 17, width: 10, height: 10))
        nessaryLabel.textColor = GreenColor()
        nessaryLabel.text = "*"
        nessaryLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(nessaryLabel)
        
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 80, height: 24))
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.text = title
        view.addSubview(titleLabel)
        
        let SubLabel = UILabel(frame: CGRect(x: ScreenWidth - 160, y: 10, width: 150, height: 24))
        SubLabel.text = subTitle
        SubLabel.textAlignment = .right
        SubLabel.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(SubLabel)
        
        switch title {
        case "物品类型":
            typeLabel = SubLabel
        case "取件时间":
            timeLabel = SubLabel
        default:
            companyLabel = SubLabel
        }
        
        let borderLineView = UIView(frame:CGRect(x: 10, y: 43.5, width: ScreenWidth - 20, height: 1))
        borderLineView.backgroundColor = BackScrollColor()
        view.addSubview(borderLineView)

    }
    
    func tapType(){

        let vc = TypeTableViewController()
        vc.delegate = self
        vc.tableTitle = "物品类型"
        navigationController?.pushViewController(vc, animated: true)
        
    }

    func tapTime(){
        
        let vc = TypeTableViewController()
        vc.delegate = self
        vc.tableTitle = "取件时间"
        navigationController?.pushViewController(vc, animated: true)

    }
 
    func tapCompany(){
        
        let vc = TypeTableViewController()
        vc.delegate = self
        vc.tableTitle = "快递公司"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func ensureBtnClick(){


//        print(sendViewTextField.text!)
//        print(acceptViewTextField.text!)
//        print(nameField.text!)
//        print(weightField.text!)
//        print(typeLabel.text!)
//        print(timeLabel.text!)
//        print(companyLabel.text!)
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      tabBarController?.tabBar.isHidden = false
    }

}

extension SendExpressViewController:passTypeDelegate{

    func passType(type: String,title:String) {
        switch title {
        case "物品类型":
            self.typeLabel.text = type
        case "取件时间":
            self.timeLabel.text = type
        default:
            self.companyLabel.text = type
        }
        
    }
}

extension SendExpressViewController:passAddressDelegate{

//    func passAddress(address: String) {
//        let attr = [NSFontAttributeName:UIFont.systemFont(ofSize: addressFontSize)]
//        let height = autoLabelHeight(with: address, labelWidth: ScreenWidth - 50 - 80, attributes: attr)
//        print(height)
//        
//    }
    
    func passAddress(address: String) {
        
        acceptViewTextView.text = address
        
    }

}
