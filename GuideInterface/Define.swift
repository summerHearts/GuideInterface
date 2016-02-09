//
//  Define.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/8.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class Define:NSObject {
    
    // 设备系统版本
   class func ifIOS7()->Bool{
        
        let t =  UIDevice.currentDevice()
        let v = t.systemVersion
        let arr:NSArray = v.componentsSeparatedByString(".")
        let num : AnyObject! = arr[0]
        let Num:CInt = num.intValue
        
        if Num >= 7 {
            return true
        }else{
            return false
        }
    }
    
    
    // 获取设备的物理高度
  class  func screenHeight()->CGFloat {
        
        let main = UIScreen.mainScreen()
        
        let rect = main.bounds
        let height = rect.height
        return height
    }
    
    // 获取设备的物理高度
  class  func screenWidth()->CGFloat {
        let main = UIScreen.mainScreen()
        let rect = main.bounds
        let width = rect.width
        return width
    }
    
var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}