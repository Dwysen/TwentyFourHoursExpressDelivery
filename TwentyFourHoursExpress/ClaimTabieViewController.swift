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
    var companyArr = ["申通","圆通","快递"]
    var currentClaim:Int?
    var deliveryArr = [TFPersonDelivery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TFNetworkTool.getAllSendExpress { (deliveryArr) in
            self.deliveryArr = deliveryArr
            print(deliveryArr.count)
            
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
            
         
        }
        
        
     
        
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        
        title = "我的快递"
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
 
        

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
        cell.companyLabel.text = companyArr[indexPath.row]
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
            companyArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    
}
