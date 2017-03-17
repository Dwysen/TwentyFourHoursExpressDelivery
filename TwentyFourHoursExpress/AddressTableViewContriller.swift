//
//  addressViewContriller.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

protocol passAddressDelegate {
    func passAddress(address:String,type:String)
}

class AddressTableViewContriller: UIViewController {

    var tableView:UITableView!
    var type = ""
    var resourse = ""
    
    var testArr = ["1","2","3","4","5","6","7","8","9"]
    
    var delegate:passAddressDelegate?
    var addressArr:Array = [AcceptAddress]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        
        //添加地址
        let addAddressBtn = UIBarButtonItem(barButtonSystemItem: .add
            , target: self, action: #selector(clickAddAddress))
        navigationItem.rightBarButtonItem = addAddressBtn
        
        // 暂无记录
        let backgroundLabel = UILabel(frame: CGRect(x: ScreenWidth / 2 - 50, y: 200, width: 100, height: 50))
        backgroundLabel.text = "暂无地址"
        backgroundLabel.textAlignment = .center
        view.addSubview(backgroundLabel)
        
     
        print(addressArr.count)
        
        
        TFNetworkTool.getAcceptAddress { (addressArr) in
            
            DispatchQueue.main.async {
                
                self.addressArr = addressArr
                
                self.setupTableView()
            }
        }

    }
    
 
  
    
    deinit {
        print("AddressTableViewController deinit")
    }

    func clickAddAddress(){
        
        let vc = AddressDetailViewController()
        vc.type = "New"
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
    func setupTableView(){
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - navigationH))
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AddressCell.self, forCellReuseIdentifier: "AddressCell")
        tableView.backgroundColor = BackScrollColor()
        tableView.tableFooterView = UIView()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clickDeleteRow(sender:AddressBtn){
        
        let alertController = UIAlertController(title: "删除地址", message: "确认删除该地址吗", preferredStyle: .alert) // 这里因为控件都不存在改变的可能，所以一律使用let类型.UIAlertControllerStyle可以选择.actionSheet或.alert
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "删除", style: .default, handler:{
            (UIAlertAction) -> Void in
            
            let deleteRowNumber = sender.tag
            self.testArr.remove(at: deleteRowNumber)
            let indexPath = IndexPath(row: deleteRowNumber, section: 0)
            self.tableView.deleteRows(at: [indexPath], with: .right)
            self.tableView.reloadData()
        })
    
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)// 当添加的UIAlertAction超过两个的时候，会自动变成纵向分布
        self.present(alertController, animated: true, completion: nil)
  
    }
 
    func clickEditRow(sender:AddressBtn){
        
        let vc = AddressDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }


}

extension AddressTableViewContriller:UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArr.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return testArr.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AddressCell(style: .default, reuseIdentifier: "AddressCell")
        cell.address = addressArr[indexPath.row]
        cell.nameLabel.text = testArr[indexPath.row]
     
        
    
       
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(clickDeleteRow(sender:)), for: .touchUpInside)
        
        cell.editBtn.tag = indexPath.row
        cell.editBtn.addTarget(self, action: #selector(clickEditRow(sender:)), for: .touchUpInside)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let text = addressArr[indexPath.row].toWhere
        let font = UIFont.systemFont(ofSize: 12)
        let attr = [NSFontAttributeName:font]
        let height = autoLabelHeight(with: text!, labelWidth: ScreenWidth - 20, attributes: attr)
        return 50 + height + 10 + 50
        
    }

}

extension AddressTableViewContriller:UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.cellForRow(at: indexPath)
//        //获得文字高度
//        let labelHeight = (cell?.height)! - 110
        
        
        // 如果是地址簿ViewContoller推进来的，则点击Cell返回地址
        
        if type != "" {
        
            delegate?.passAddress(address: testArr[indexPath.row],type:type)
            _ = navigationController?.popViewController(animated: true)
        
        }
//        if resourse == ""{
//            
//            // 如果是我的界面地址栏推进来的,则点击Cell没有事件
//        
//        
//        
//        }
        
        
   
    

    }
    
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//        testArr.remove(at: indexPath)
//            print(testArr)
//            tableView.deleteRows(at: [indexPath], with: .right)
//        }
//    }

}
