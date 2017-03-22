//
//	orderData.swift
//
//	Create by apple on 22/3/2017
//	Copyright © 2017. All rights reserved.


import Foundation

struct ExpressOrder{

	var deliveryCompany : String!
	var goodsDescription : String!
	var goodsName : String!
	var goodsWeight : String!
	var pickTime : String!
	var receiverId : String!
	var remarks : String!
	var sender : String!
	var senderId : String!


	/**
	 * 用NSDictionary来初始化实例，并设置各属性值。
	 */
    
    init(senderID:String,receiverID:String,goodsName:String,goodsWeight:String,goodsDescription:String,pickTime:String,remarks:String,deliveryCompany:String) {
        self.senderId = senderID
        self.receiverId = receiverID
        self.goodsName = goodsName
        self.goodsWeight = goodsWeight
        self.goodsDescription = goodsDescription
        self.pickTime = pickTime
        self.deliveryCompany = deliveryCompany
        self.remarks = remarks
        
    }
    
	init(fromDictionary dictionary: NSDictionary){
		deliveryCompany = dictionary["delivery_company"] as? String
		goodsDescription = dictionary["goods_description"] as? String
		goodsName = dictionary["goods_name"] as? String
		goodsWeight = dictionary["goods_weight"] as? String
		pickTime = dictionary["pick_time"] as? String
		receiverId = dictionary["receiver_id"] as? String
		remarks = dictionary["remarks"] as? String
		sender = dictionary["sender"] as? String
		senderId = dictionary["sender_id"] as? String
	}

	/**
	 * 返回一个包含所有属性值的NSDictionary对象，KEY是对应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if deliveryCompany != nil{
			dictionary["delivery_company"] = deliveryCompany
		}
		if goodsDescription != nil{
			dictionary["goods_description"] = goodsDescription
		}
		if goodsName != nil{
			dictionary["goods_name"] = goodsName
		}
		if goodsWeight != nil{
			dictionary["goods_weight"] = goodsWeight
		}
		if pickTime != nil{
			dictionary["pick_time"] = pickTime
		}
		if receiverId != nil{
			dictionary["receiver_id"] = receiverId
		}
		if remarks != nil{
			dictionary["remarks"] = remarks
		}
		if sender != nil{
			dictionary["sender"] = sender
		}
		if senderId != nil{
			dictionary["sender_id"] = senderId
		}
		return dictionary
	}

}
