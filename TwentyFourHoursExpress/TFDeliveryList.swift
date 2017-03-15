//
//	TFDeliveryList.swift
//
//	Create by apple on 15/3/2017
//	Copyright © 2017. All rights reserved.


import Foundation

struct TFDeliveryList{

	var info : String!
	var personDelivery : [TFPersonDelivery]!
	var personInfo : TFPersonInfo!
	var status : Int!


	/**
	 * 用NSDictionary来初始化实例，并设置各属性值。
	 */
	init(fromDictionary dictionary: NSDictionary){
		info = dictionary["info"] as? String
		personDelivery = [TFPersonDelivery]()
		if let personDeliveryArray = dictionary["personDelivery"] as? [NSDictionary]{
			for dic in personDeliveryArray{
				let value = TFPersonDelivery(fromDictionary: dic)
				personDelivery.append(value)
			}
		}
		if let personInfoData = dictionary["personInfo"] as? NSDictionary{
				personInfo = TFPersonInfo(fromDictionary: personInfoData)
			}
		status = dictionary["status"] as? Int
	}

	/**
	 * 返回一个包含所有属性值的NSDictionary对象，KEY是对应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if info != nil{
			dictionary["info"] = info
		}
		if personDelivery != nil{
			var dictionaryElements = [NSDictionary]()
			for personDeliveryElement in personDelivery {
				dictionaryElements.append(personDeliveryElement.toDictionary())
			}
			dictionary["personDelivery"] = dictionaryElements
		}
		if personInfo != nil{
			dictionary["personInfo"] = personInfo.toDictionary()
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

}
