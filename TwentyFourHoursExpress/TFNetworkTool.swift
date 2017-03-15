//
//  TFNetworkTool.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import Foundation


class TFNetworkTool:NSObject {
    
    class func RegisterWithURLSession(phone:String,pwd:String,code:String,finished:@escaping (_ code:Int,_ info:String) -> ()){
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliveryApi/user/userRegister")
        
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "phone=\(phone)&pwd=\(pwd)&code=\(code)".data(using: String.Encoding.utf8)
     
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                guard responseObject != nil else{
                    return
                }

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
                
                guard responseObject != nil else{
                 
                    return
                
                }
                
                let status = responseObject?["status"] as! Int
                let info = responseObject?["info"] as! String
                
                if status == 200 {
                    let sloat = responseObject?["sloat"] as! String
                    finished(status, info, sloat)
                }  else {
                    finished(status,info,"sloat is nil")
                }
                
                
               
                
                
                
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    class func getDeliveryInformation(phone:String,token:String,finished:@escaping (_ status:Int ) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliveryApi/Delivery/personalDeliveryList")
        var request = URLRequest(url: url!)
        request.httpBody = "phone=\(phone)&token=\(token)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
      
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                guard responseObject != nil else{
                    return
                }
                let status = responseObject?["status"] as! Int
           
                finished(status)
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    class func getIdentifyCode(phone:String,finished:@escaping (_ status:Int, _ code:String ) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliveryApi/user/smsCode")
        var request = URLRequest(url: url!)
        request.httpBody = "phone=\(phone)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                guard responseObject != nil else{
                    return
                }
                let status = responseObject?["status"] as! Int
                let code = responseObject?["code"] as! String
                
                finished(status, code)
                
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
        
    }
    
    
//    class func getResponseObject(request:URLRequest ) -> [String:Any]{
//        
//        var responseObject : [String:Any]!
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, response, error) in
//           
//                responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
//                print(responseObject)
//                return responseObject
//    
//        }
//        return responseObject
//        task.resume()
//    }
    
    
    class func getAllSendExpress(phone:String,token:String,finished:@escaping (_ code:Int,_ info:String) -> ()){
    
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliveryApi/Delivery/personalDeliveryList")

        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "phone=\(phone)&token=\(token)".data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
 
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                guard responseObject != nil else{
                    return
                }

                let status = responseObject?["status"] as! Int
                let personDeliveryarr = responseObject?["personDelivery"] as! [Any]
                var DeliveryArr = [TFPersonDelivery]()
                for item in personDeliveryarr{
                    let delivery = TFPersonDelivery(fromDictionary: item as! NSDictionary)
                    DeliveryArr.append(delivery)
                
                }
                print(DeliveryArr.count)
                print(DeliveryArr[0].clientId)
                print(DeliveryArr[1].clientPhone)
                
                //TO DO
            
                let info = responseObject?["info"] as! String
                
                finished(status, info)
                
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    
    




    
}



    
    
    

