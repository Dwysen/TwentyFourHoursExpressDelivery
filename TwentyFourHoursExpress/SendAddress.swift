//
//	SendPersonDelivery.swift
//
//	Create by apple on 21/3/2017
//	Copyright © 2017. All rights reserved.


import Foundation

struct SendAddress{

	var clientId : String!
	var clientPhone : String!
	var fromDistrictCode : String!
	var fromWhere : String!
	var fromWhom : String!
	var fromWhomPhone : String!
	var id : String!
	var isDefalut : String!
	var isDel : String!


	/**
	 * 用NSDictionary来初始化实例，并设置各属性值。
	 */
	init(fromDictionary dictionary: NSDictionary){
		clientId = dictionary["client_id"] as? String
		clientPhone = dictionary["client_phone"] as? String
		fromDistrictCode = dictionary["from_district_code"] as? String
		fromWhere = dictionary["from_where"] as? String
		fromWhom = dictionary["from_whom"] as? String
		fromWhomPhone = dictionary["from_whom_phone"] as? String
		id = dictionary["id"] as? String
		isDefalut = dictionary["is_defalut"] as? String
		isDel = dictionary["is_del"] as? String
	}
    
    init(id:String,fromWhere:String,fromWhom:String,fromWhomPhone:String) {
        self.id = id
        self.fromWhere = fromWhere
        self.fromWhom = fromWhom
        self.fromWhomPhone = fromWhomPhone
        
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
		if clientPhone != nil{
			dictionary["client_phone"] = clientPhone
		}
		if fromDistrictCode != nil{
			dictionary["from_district_code"] = fromDistrictCode
		}
		if fromWhere != nil{
			dictionary["from_where"] = fromWhere
		}
		if fromWhom != nil{
			dictionary["from_whom"] = fromWhom
		}
		if fromWhomPhone != nil{
			dictionary["from_whom_phone"] = fromWhomPhone
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isDefalut != nil{
			dictionary["is_defalut"] = isDefalut
		}
		if isDel != nil{
			dictionary["is_del"] = isDel
		}
		return dictionary
	}

}
