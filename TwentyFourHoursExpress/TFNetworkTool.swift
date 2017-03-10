//
//  TFNetworkTool.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import Foundation


class TFNetworkTool:NSObject {
    
    class func postWithURLSession(string:String){
        let url = URL(string: string)
        //        let str = self.parmasStringWithParmas(parmas)
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "name=18612038633&pwd=123456".data(using: String.Encoding.utf8)
        //        request.httpBody = str.data(using: String.Encoding.utf8.rawValue)
        let task = session.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let responseObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                print(responseObject ?? 0)
                
            }
            else {
                print("data == nil")
            }
            
        }
        task.resume()
    }
    
}
