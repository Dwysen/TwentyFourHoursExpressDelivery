//
//  TFNetworkTool.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import Foundation


class TFNetworkTool:NSObject {
    
    class func RegisterWithURLSession(phone:String,pwd:String,finished:@escaping (_ code:Int,_ info:String) -> ()){
//        let url = URL(string: "http://www.boss24delivery.com/index.php/admin/index/admin_list_data")
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliveryApi/user/userRegister")
        
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
//        request.httpBody = "name=18612038633&pwd=123456".data(using: String.Encoding.utf8)
        request.httpBody = "phone=\(phone)&pwd=\(pwd)".data(using: String.Encoding.utf8)
     
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]

                let status = responseObject?["status"] as! Int
                let info = responseObject?["info"] as! String
                
                finished(status, info)

            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    class func LoginWithURLSession(phone:String,pwd:String,finished:@escaping (_ code:Int, _ info:String, _ sloat:String) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliveryApi/user/checkLogin")

        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        request.httpBody = "phone=\(phone)&pwd=\(pwd)".data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                let status = responseObject?["status"] as! Int
                let info = responseObject?["info"] as! String
                let sloat = responseObject?["sloat"] as! String
                
                finished(status, info, sloat)
                
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    class func getDeliveryInformation(phone:String,token:String,finished:@escaping (_ status:Int ) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliveryApi/Delivery/personalDeliveryList")
        
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "phone=\(phone)&token=\(token)".data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                let status = responseObject?["status"] as! Int
           
                finished(status)
                
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }

        
     
    
    }
    
    
    

