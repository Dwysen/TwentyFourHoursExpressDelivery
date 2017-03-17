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
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliApi/user/userRegister")
        
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
    
    // 用户名 密码 登录
    
    class func LoginWithPassword(phone:String,pwd:String,finished:@escaping (_ code:Int, _ info:String, _ sloat:String) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliApi/user/checkLogin")

        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        request.httpBody = "phone=\(phone)&pwd=\(pwd)".data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                print(responseObject)
                
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
    
    
    // 用户名 密码 登录
    
    class func LoginWithIdentify(phone:String,code:String,finished:@escaping (_ response:[String:Any]) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliApi/user/phoneCodeLogin")
        
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        print(phone)
        print(code)
        
        request.httpBody = "phone=\(phone)&code=\(code)".data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                print(responseObject)
                
                guard responseObject != nil else{
                    return
                }
                
                let status = responseObject?["status"] as! Int
                
                if status == 200 {
                    finished(responseObject!)
                }  else {
                    return
                }
            }
                
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    // 获取收件地址
    
    class func getAcceptAddress(finished:@escaping (_ addressArr:[AcceptAddress] ) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliApi/user/userToAddr")
        var request = URLRequest(url: url!)
        
        let phone = UserDefaults.standard.string(forKey: "phone")
        let token = UserDefaults.standard.string(forKey: "token")
        
        request.httpBody = "phone=\(phone!)&token=\(token!)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
      
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                guard responseObject != nil else{
                    return
                }
                
                print(responseObject)
                
                let status = responseObject?["status"] as! Int
         
                guard status == 200 else{
                    return
                }
                
                let acceptAddressArr = responseObject?["personDelivery"] as! [Any]
                var addressArr = [AcceptAddress]()
                for item in acceptAddressArr{
                    let address = AcceptAddress(fromDictionary: item as! NSDictionary)
                    addressArr.append(address)
                    
                }

              
           
                finished(addressArr)
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    
    // 获取验证码
    
    class func getIdentifyCode(phone:String,finished:@escaping (_ status:Int, _ code:String ) -> ()){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliApi/user/smsCode")
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
                
                print(responseObject)
                
                let status = responseObject?["status"] as! Int
                let code = responseObject?["code"] as! String
                
                print(code)
                
                finished(status, code)
                
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
    // 获取验证码
    
    class func postTest(){
        
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliApi/user/updateUserToAddr")
        var request = URLRequest(url: url!)
        
        let phone = UserDefaults.standard.string(forKey: "phone")
        let token = UserDefaults.standard.string(forKey: "token")
        
        let params:[String:Any] = ["phone":"\(phone!)","token":"\(token!)","data":["phone":"18612038633","addr":"北京","desc":"北京大望路","time":"2017-11-13"]]
        let jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                
                print("data != nil")
                
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                print(responseObject ?? 0)
                
                guard responseObject != nil else{
                    return
                }
//                let status = responseObject?["status"] as! Int
//                let code = responseObject?["code"] as! String
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
    
    
    class func getAllSendExpress(finished:@escaping (_ deliveryArr:[TFPersonDelivery]) -> ()){
    
        let url = URL(string: "http://www.lishidewo.com/index.php/DeliApi/delivery/personalDeliveryList")

        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let phone = UserDefaults.standard.string(forKey: "phone")
        let token = UserDefaults.standard.string(forKey: "token")
        
        request.httpBody = "phone=\(phone!)&token=\(token!)".data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
 
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
              
                guard responseObject != nil else{
                    return
                }
                print(token!)
                print(responseObject ?? 0)

                let status = responseObject?["status"] as! Int
                
                guard status == 200 else {
                    return
                }
                
                let personDeliveryarr = responseObject?["personDelivery"] as! [Any]
                var deliveryArr = [TFPersonDelivery]()
                for item in personDeliveryarr{
                    let delivery = TFPersonDelivery(fromDictionary: item as! NSDictionary)
                    deliveryArr.append(delivery)
                
                }
                //TO DO
            
//                let info = responseObject?["info"] as! String 
                
                finished(deliveryArr)
                
                
            }
            else {
                print("data == nil")
            }
        }
        task.resume()
    }
    
}



    
    
    

