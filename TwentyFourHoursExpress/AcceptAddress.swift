//
//	AddressPersonDelivery.swift
//
//	Create by apple on 16/3/2017
//	Copyright © 2017. All rights reserved.


import Foundation

struct AcceptAddress{

	var clientId : String!
	var id : String!
	var isDefalut : String!
	var toDistrictCode : String!
	var toWhere : String!
	var toWhom : String!
	var toWhomPhone : String!


	/**
	 * 用NSDictionary来初始化实例，并设置各属性值。
	 */
	init(fromDictionary dictionary: NSDictionary){
//		clientId = dictionary["client_id"] as? String
		id = dictionary["id"] as? String 
//		isDefalut = dictionary["is_defalut"] as? String
//		toDistrictCode = dictionary["to_district_code"] as? String
		toWhere = dictionary["to_where"] as? String
		toWhom = dictionary["to_whom"] as? String
		toWhomPhone = dictionary["receiver_phone"] as? String
	}
    
    init(id:String,toWhere:String,toWhom:String,toWhomPhone:String) {
        self.id = id
        self.toWhere = toWhere
        self.toWhom = toWhom
        self.toWhomPhone = toWhomPhone

    }
    
	/**
	 * 返回一个包含所有属性值的NSDictionary对象，KEY是对应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if clientId != nil{
			dictionary["client_id"] = clientId
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isDefalut != nil{
			dictionary["is_defalut"] = isDefalut
		}
		if toDistrictCode != nil{
			dictionary["to_district_code"] = toDistrictCode
		}
		if toWhere != nil{
			dictionary["to_where"] = toWhere
		}
		if toWhom != nil{
			dictionary["to_whom"] = toWhom
		}
		if toWhomPhone != nil{
			dictionary["to_whom_phone"] = toWhomPhone
		}
		return dictionary
	}

}
