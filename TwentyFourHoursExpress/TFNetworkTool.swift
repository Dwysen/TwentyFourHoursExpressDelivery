//
//  TFNetworkTool.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import Foundation


class TFNetworkTool:NSObject {
    
    class func postWithURLSession(finished:@escaping (_ code:String) -> ()){
        let url = URL(string: "http://www.boss24delivery.com/index.php/admin/index/admin_list_data")
        //        let str = self.parmasStringWithParmas(parmas)
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
//        request.httpBody = "name=18612038633&pwd=123456".data(using: String.Encoding.utf8)
        request.httpBody = "phone=18612038633&pwd=123456".data(using: String.Encoding.utf8)
     
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                print(responseObject ?? 0)
                
                finished("200")
                
            }
            else {
                print("data == nil")
            }
            
            
        }
        task.resume()
    }
    
}
