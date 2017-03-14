//
//  MeViewController.swift
//  MasterClub
//
//  Created by apple on 17/2/17.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit
import Foundation



class MeViewController: UIViewController {
    
    fileprivate var ViewY:CGFloat?
    
    fileprivate var tableView:UITableView!
    fileprivate var tableHeadView:UIView!
    fileprivate var headBottomView:UIView!
    
    fileprivate var verticalLineView:UIView!
    fileprivate var horizonLineView:UIView!
    fileprivate let titleArr = [["寄件地址","收件地址"],["联系我们","投诉建议"]]
    fileprivate let imageArr = [["sendAddress","acceptAddress"],["contactUs","advice"]]
    
    //    文库类别View高度
    //    let libraryLogoViewHeight:CGFloat = 30
    //
    //    let titleViewHeight:CGFloat = 80
    
    
//    override func loadView() {
//        
//    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
     
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupTableHeadView()
        
        setupTableView()
        
        //        BackScrollView.contentSize = CGSize(width: ScreenWidth, height: ViewY! + 10 + 50)
        //        view.addSubview(BackScrollView)
        
        view.backgroundColor = UIColor.white

        
    }
    
    
    private func setupTableHeadView(){
        
        let settingBtn = headTopView.settingButton
        settingBtn.addTarget(self, action: #selector(clickSettingBtn), for: .touchUpInside)
        
        let iconBtn = headTopView.iconButton
        iconBtn.addTarget(self, action: #selector(clickIconBtn), for: .touchUpInside)
     
        headBottomView = UIView(frame: CGRect(x: 0, y: 200, width: ScreenWidth, height: 100))
        for i in 0..<4 {
            let btnW = ScreenWidth / 2
            let btn = MeButton(frame: CGRect(x: CGFloat(i).truncatingRemainder(dividingBy: 2) * btnW, y: 0, width: btnW, height: 50))
            let btnTitleArr = ["理赔","商城","积分","服务"]
            btn.setTitle(btnTitleArr[i], for: .normal)
            btn.setImage(UIImage(named:btnTitleArr[i]), for: .normal)
            btn.setTitleColor(TFColor(89, g: 89, b: 89, a: 1), for: .normal)
            btn.backgroundColor = UIColor.white
//            btn.layer.borderColor = TFColor(89, g: 89, b: 89, a: 1).cgColor
//            btn.layer.borderWidth = 1
            
            if i > 1 {
                btn.y = 50
            }
            
            headBottomView.addSubview(btn)
        }
        
        //按钮区域划分割线
        
        horizonLineView = UIView(frame: CGRect(x: 0, y: 49.5, width: ScreenWidth, height: 1))
        horizonLineView.backgroundColor = TFColor(229, g: 229, b: 229, a: 1)
        
        verticalLineView = UIView(frame: CGRect(x: ScreenWidth/2 - 0.5, y: 0, width: 1, height: 100))
        verticalLineView.backgroundColor = TFColor(229, g: 229, b: 229, a: 1)
        
        headBottomView.addSubview(horizonLineView)
        headBottomView.addSubview(verticalLineView)
        
        
        tableHeadView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 300))
        tableHeadView.addSubview(headTopView)
        tableHeadView.addSubview(headBottomView)
        
        
    }
    
    func setupTableView(){
    
        tableView = UITableView(frame: CGRect(x: 0, y: -20, width: ScreenWidth, height: ScreenHeight - tabbarH + 20  ),style:.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = tableHeadView
     
        view.addSubview(tableView)
        
    }
    
    func clickIconBtn(){
    
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    
    }
    
    func clickSettingBtn(){
       
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    fileprivate lazy var BackScrollView:UIScrollView = {
    //
    //        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: SCREENH))
    //        scrollView.isScrollEnabled = true
    //        return scrollView
    //
    //    }()
    
     lazy var headTopView: HeadTopView = {
        let headTopView = HeadTopView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
        
        //        headerView.iconButton.addTarget(self, action: #selector(iconButtonClick), forControlEvents: .TouchUpInside)
        //        headerView.messageButton.addTarget(self, action: #selector(messageButtonClick), forControlEvents: .TouchUpInside)
        //        headerView.settingButton.addTarget(self, action: #selector(settingButtonClick), forControlEvents: .TouchUpInside)
        return headTopView
    }()
}

extension MeViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MeCell()
        
        cell.textLabel?.text = titleArr[indexPath.section == 0 ? 0:1][indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.imageView?.image = UIImage(named: imageArr[indexPath.section == 0 ? 0:1][indexPath.row])
        
        return cell
    }


}

extension MeViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            //寄件地址
            if indexPath.row == 0 {
            
                let token = UserDefaults.standard.string(forKey: "token")
                let phone = UserDefaults.standard.string(forKey: "phone")
                
                guard token != nil && phone != nil else {
                    showErrorWithTitle(title: "请登录", autoCloseTime: 0.5)
                    return
                }
                
                TFNetworkTool.getDeliveryInformation(phone: phone!, token: token!, finished: { (status) in
                    
                    if status == 200 {
                    
                        print("成功")
                        
                    } else {
                    
                        print("失败")
                    
                    }
                    
                })
    
                let vc = AddressTableViewContriller()
                navigationController?.pushViewController(vc, animated: true)
                
             
                
            }
            
            if indexPath.row == 1 {
            
                let vc = AddressTableViewContriller()
                navigationController?.pushViewController(vc, animated: true)
                
            }
            
            
        default:
            
            if indexPath.row == 0 {
                
                let alertController = UIAlertController(title: "联系我们", message: "拨打24小时官网电话", preferredStyle: .alert) // 这里因为控件都不存在改变的可能，所以一律使用let类型.UIAlertControllerStyle可以选择.actionSheet或.alert
                
                let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                let okAction = UIAlertAction(title: "呼叫", style: .default, handler:{
                    (UIAlertAction) -> Void in
                    
                
                })
                
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)// 当添加的UIAlertAction超过两个的时候，会自动变成纵向分布
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            if indexPath.row == 1 {
            
                let vc = AdviceViewController()
                navigationController?.pushViewController(vc, animated: true)
            
            }
            
        }
    }
    
}
