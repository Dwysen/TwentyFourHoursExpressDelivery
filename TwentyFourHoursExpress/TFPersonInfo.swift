//
//	TFPersonInfo.swift
//
//	Create by apple on 15/3/2017
//	Copyright © 2017. All rights reserved.


import Foundation

struct TFPersonInfo{

	var avatar : String!
	var id : String!
	var isDel : String!
	var level : String!
	var name : String!
	var phone : String!
	var pwd : String!
	var registerTime : String!
	var sex : String!
	var sloat : String!
	var status : String!
	var updateTime : String!


	/**
	 * 用NSDictionary来初始化实例，并设置各属性值。
	 */
	init(fromDictionary dictionary: NSDictionary){
		avatar = dictionary["avatar"] as? String
		id = dictionary["id"] as? String
		isDel = dictionary["is_del"] as? String
		level = dictionary["level"] as? String
		name = dictionary["name"] as? String
		phone = dictionary["phone"] as? String
		pwd = dictionary["pwd"] as? String
		registerTime = dictionary["register_time"] as? String
		sex = dictionary["sex"] as? String
		sloat = dictionary["sloat"] as? String
		status = dictionary["status"] as? String
		updateTime = dictionary["update_time"] as? String
	}

	/**
	 * 返回一个包含所有属性值的NSDictionary对象，KEY是对应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if avatar != nil{
			dictionary["avatar"] = avatar
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isDel != nil{
			dictionary["is_del"] = isDel
		}
		if level != nil{
			dictionary["level"] = level
		}
		if name != nil{
			dictionary["name"] = name
		}
		if phone != nil{
			dictionary["phone"] = phone
		}
		if pwd != nil{
			dictionary["pwd"] = pwd
		}
		if registerTime != nil{
			dictionary["register_time"] = registerTime
		}
		if sex != nil{
			dictionary["sex"] = sex
		}
		if sloat != nil{
			dictionary["sloat"] = sloat
		}
		if status != nil{
			dictionary["status"] = status
		}
		if updateTime != nil{
			dictionary["update_time"] = updateTime
		}
		return dictionary
	}

}
