//
//  ClaimTabieViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class ClaimTabieViewController: UIViewController {

    
    var tableView:UITableView!
    
    var currentClaim:Int?
    var deliveryArr = [TFPersonDelivery]()
    
    var backgroundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        backgroundLabel = UILabel(frame: CGRect(x: ScreenWidth / 2 - 50, y: 200, width: 100, height: 50))
        backgroundLabel.text = "努力刷新中..."
        backgroundLabel.textColor = TitleGrayColor()
        backgroundLabel.textAlignment = .center
        view.addSubview(backgroundLabel)
        
        
        TFNetworkTool.getAllSendExpress { (deliveryArr) in
            
            guard deliveryArr.count != 0 else {
                self.backgroundLabel.text = "暂无快递信息"
                return
            }
            
            self.deliveryArr = deliveryArr
            
            DispatchQueue.main.async {
                
                self.backgroundLabel.isHidden = true
                
                self.tableView = UITableView(frame: CGRect(x: 0, y: navigationH, width: ScreenWidth, height: ScreenHeight))
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.view.addSubview(self.tableView)
            }
            
        }
        
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        
        title = "我的快递"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    func clickClaimBtn(sender:UIButton){
        
        currentClaim = sender.tag
        
        let vc = ClaimReasonTableViewController()
        present(vc, animated: true) {
            
            vc.delegete = self
            
        }
        
    }

}

extension ClaimTabieViewController:ClickClaimProtocol{

    func ClickClaimBtn() {
        
        let currentIndexP = IndexPath(row: currentClaim!, section: 0)
        let cell = tableView.cellForRow(at: currentIndexP) as? ClaimCell
        cell?.claimBtn.backgroundColor = BtnGrayColor()
        cell?.claimBtn.isEnabled = false
        cell?.statusLabel.text = "审核中"
        cell?.statusLabel.textColor = OrangeColor()
        
    }

}

extension ClaimTabieViewController:UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ClaimCell()
        cell.delivery = deliveryArr[indexPath.row]
        cell.claimBtn.tag = indexPath.row
        cell.claimBtn.addTarget(self, action: #selector(clickClaimBtn(sender: )), for: .touchUpInside)
        cell.claimBtn.tag = indexPath.row
//        cell.companyLabel.text = companyArr[indexPath.row] 
        return cell
    }

}

extension ClaimTabieViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = LogisticalDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deliveryArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
            
            if deliveryArr.count == 0 {
            
                tableView.isHidden = true
                let emptyLabel = UILabel(frame: CGRect(x: ScreenWidth / 2 - 100, y: 200, width: 200, height: 10))
                emptyLabel.textAlignment = .center
                emptyLabel.text = "暂无快递信息"
                view.addSubview(emptyLabel)
                
            }
        }
    }
}
