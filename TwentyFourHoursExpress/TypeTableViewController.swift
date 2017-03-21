//
//  TypeTableViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/6.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

protocol passTypeDelegate {
    func passType(type:String,title:String)
}

class TypeTableViewController: UITableViewController {

    var delegate:passTypeDelegate?
    var tableTitle: String?
    let typeArr = ["类型","类型","类型","类型","类型","类型","类型","类型"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return typeArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = typeArr[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.passType(type: typeArr[indexPath.row],title:tableTitle!)
        _ = navigationController?.popViewController(animated: true)
    }

}
