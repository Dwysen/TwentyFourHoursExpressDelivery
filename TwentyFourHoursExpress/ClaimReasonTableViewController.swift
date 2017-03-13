//
//  ClaimReasonTableViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/13.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

protocol ClickClaimProtocol {
    func ClickClaimBtn()
}

class ClaimReasonTableViewController: UIViewController {

    private var tableView:UITableView!
    let acceptWayArr = ["支付宝","银行卡"]
    let reasonArr = ["丢了","坏了","没了","废了","飞了"]
    var delegete:ClickClaimProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func clickEnsureBtn(){
    
        self.showRightWithTitle(title: "提交成功，请等待审核", autoCloseTime: 2)
        
        dismiss(animated: true) {
            
            self.delegete?.ClickClaimBtn()
            
        }
        
    }
    
    func clickCancleBtn(){
        
        dismiss(animated: true) {
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupUI(){
    
        view.backgroundColor = UIColor.white
        
        tableView = UITableView(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: 400))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        let cancleBtn = UIButton(frame: CGRect(x: 0, y: ScreenHeight - 45, width: ScreenWidth / 2, height: 45))
        cancleBtn.addTarget(self, action: #selector(clickCancleBtn), for: .touchUpInside)
        cancleBtn.backgroundColor = BtnGrayColor()
        cancleBtn.setTitleColor(UIColor.white, for: .normal)
        cancleBtn.setTitle("取消", for: .normal)
        
        view.addSubview(cancleBtn)
        
        let ensureBtn = UIButton(frame: CGRect(x: ScreenWidth / 2, y: cancleBtn.y, width: ScreenWidth / 2 , height: 45))
        ensureBtn.addTarget(self, action: #selector(clickEnsureBtn), for: .touchUpInside)
        ensureBtn.backgroundColor = GreenColor()
        ensureBtn.setTitleColor(UIColor.white, for: .normal)
        ensureBtn.setTitle("提交", for: .normal)
        
        view.addSubview(ensureBtn)
    
    }
    
}

extension ClaimReasonTableViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return reasonArr.count
        }
        else {
        return 2
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: .value2, reuseIdentifier: "cell")
        cell.tintColor = GreenColor()
        
        if indexPath.section == 0 {
        
            cell.textLabel?.text = reasonArr[indexPath.row]
        
        }
        
        if indexPath.section == 1 {
        
            cell.textLabel?.text = acceptWayArr[indexPath.row]
            
        }
        
        return cell
        
        
    }
    

}

extension ClaimReasonTableViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var reasonCellArr = [UITableViewCell]()
        var acceptWayCellArr = [UITableViewCell]()
        
        let ViCell = tableView.visibleCells
        
        for cell in ViCell {
            
            if reasonArr.contains((cell.textLabel?.text)!) {
                reasonCellArr.append(cell)
            } else {
                acceptWayCellArr.append(cell)
            }
        }
        
        let selectCell = tableView.cellForRow(at: indexPath)
        
        switch indexPath.section {
            
        case 0:
            
            for cell in reasonCellArr  {
                cell.accessoryType = .none
            }
            selectCell?.accessoryType = .checkmark
            
        default:
            
            for cell in acceptWayCellArr  {
                cell.accessoryType = .none
            }
            selectCell?.accessoryType = .checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 35))
        headerView.backgroundColor = BackScrollColor()
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: ScreenWidth, height: 35))
        titleLabel.textAlignment = .left
        
        if section == 0 {
        
            titleLabel.text = "请选择您的理赔原因："
            
        } else {
        
            titleLabel.text = "请选择您的赔付方式："
        
        }
        
        headerView.addSubview(titleLabel)
        
        return headerView
        
    }
    
}
