//
//  Global.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

public let screenMargin:CGFloat = 10

public let navigationH:CGFloat = 64
public let tabbarH:CGFloat = 49
public let contentViewHeight:CGFloat = 200

func TFColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func BackScrollColor() -> UIColor{
    return TFColor(240, g: 239, b: 245, a: 1)
}

func TitleGrayColor() -> UIColor{
    return TFColor(89, g: 89, b: 89, a: 1)
}

func BtnGrayColor() -> UIColor{
    return TFColor(204, g: 204, b: 204, a: 1)
}


func GreenColor() -> UIColor{
    return TFColor(39, g: 183, b: 158, a: 1)
}

func OrangeColor() -> UIColor{
    return TFColor(255, g: 139, b: 52, a: 1)
}


func autoLabelHeight(with text:String , labelWidth: CGFloat ,attributes : [String : Any]) -> CGFloat{
    var size = CGRect()
    let width = CGSize(width: labelWidth, height: 0)//设置label的最大宽度
    size = text.boundingRect(with: width, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes , context: nil);
    return size.size.height
}



// 验证是否是手机号
func isTelNumber(num:NSString)->Bool
{
    let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
    let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
    let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
    let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
    let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
    let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
    let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
    let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
    if ((regextestmobile.evaluate(with: num) == true)
        || (regextestcm.evaluate(with: num)  == true)
        || (regextestct.evaluate(with: num) == true)
        || (regextestcu.evaluate(with: num) == true))
    {
        return true
    }
    else
    {
        return false
    }
}
