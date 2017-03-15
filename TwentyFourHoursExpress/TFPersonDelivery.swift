//
//	TFPersonDelivery.swift
//
//	Create by apple on 15/3/2017
//	Copyright © 2017. All rights reserved.


import Foundation

struct TFPersonDelivery{

	var clientId : String!
	var clientPhone : String!
	var count : String!
	var deliveryId : String!
	var deliveryNum : String!
	var deliveryPhone : String!
	var deliveryStatus : String!
	var deliveryType : String!
	var descriptionField : String!
	var fromUserId : String!
	var fromWhere : String!
	var fromWhom : String!
	var id : String!
	var inscuranceStatus : String!
	var insertTime : String!
	var insurance : String!
	var isDel : String!
	var isElectronic : String!
	var orderStatus : String!
	var payStatus : String!
	var price : String!
	var startTime : String!
	var toWhere : String!
	var toWhom : String!
	var weight : String!


	/**
	 * 用NSDictionary来初始化实例，并设置各属性值。
	 */
	init(fromDictionary dictionary: NSDictionary){
		clientId = dictionary["client_id"] as? String
		clientPhone = dictionary["client_phone"] as? String
		count = dictionary["count"] as? String
		deliveryId = dictionary["delivery_id"] as? String
		deliveryNum = dictionary["delivery_num"] as? String
		deliveryPhone = dictionary["delivery_phone"] as? String
		deliveryStatus = dictionary["delivery_status"] as? String
		deliveryType = dictionary["delivery_type"] as? String
		descriptionField = dictionary["description"] as? String
		fromUserId = dictionary["from_user_id"] as? String
		fromWhere = dictionary["from_where"] as? String
		fromWhom = dictionary["from_whom"] as? String
		id = dictionary["id"] as? String
		inscuranceStatus = dictionary["inscurance_status"] as? String
		insertTime = dictionary["insert_time"] as? String
		insurance = dictionary["insurance"] as? String
		isDel = dictionary["is_del"] as? String
		isElectronic = dictionary["is_electronic"] as? String
		orderStatus = dictionary["order_status"] as? String
		payStatus = dictionary["pay_status"] as? String
		price = dictionary["price"] as? String
		startTime = dictionary["start_time"] as? String
		toWhere = dictionary["to_where"] as? String
		toWhom = dictionary["to_whom"] as? String
		weight = dictionary["weight"] as? String
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
		if count != nil{
			dictionary["count"] = count
		}
		if deliveryId != nil{
			dictionary["delivery_id"] = deliveryId
		}
		if deliveryNum != nil{
			dictionary["delivery_num"] = deliveryNum
		}
		if deliveryPhone != nil{
			dictionary["delivery_phone"] = deliveryPhone
		}
		if deliveryStatus != nil{
			dictionary["delivery_status"] = deliveryStatus
		}
		if deliveryType != nil{
			dictionary["delivery_type"] = deliveryType
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if fromUserId != nil{
			dictionary["from_user_id"] = fromUserId
		}
		if fromWhere != nil{
			dictionary["from_where"] = fromWhere
		}
		if fromWhom != nil{
			dictionary["from_whom"] = fromWhom
		}
		if id != nil{
			dictionary["id"] = id
		}
		if inscuranceStatus != nil{
			dictionary["inscurance_status"] = inscuranceStatus
		}
		if insertTime != nil{
			dictionary["insert_time"] = insertTime
		}
		if insurance != nil{
			dictionary["insurance"] = insurance
		}
		if isDel != nil{
			dictionary["is_del"] = isDel
		}
		if isElectronic != nil{
			dictionary["is_electronic"] = isElectronic
		}
		if orderStatus != nil{
			dictionary["order_status"] = orderStatus
		}
		if payStatus != nil{
			dictionary["pay_status"] = payStatus
		}
		if price != nil{
			dictionary["price"] = price
		}
		if startTime != nil{
			dictionary["start_time"] = startTime
		}
		if toWhere != nil{
			dictionary["to_where"] = toWhere
		}
		if toWhom != nil{
			dictionary["to_whom"] = toWhom
		}
		if weight != nil{
			dictionary["weight"] = weight
		}
		return dictionary
	}

}
