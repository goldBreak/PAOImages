//
//  Config.swift
//  PAOImages
//
//  Created by xsd on 2018/3/26.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit


class Config {
    
    static let kScreenWidth : CGFloat = UIScreen.main.bounds.size.width
    
    static let kScreenHeight : CGFloat = UIScreen.main.bounds.size.height
    
    //状态栏高度
    static let kDeviceToolStatue : CGFloat = UIApplication.shared.statusBarFrame.size.height
    
    static let kDeviceBarHeight : CGFloat = 44.0
    
    static let kDeviceTabBarHeight : CGFloat = (kDeviceBarHeight > 20.0 ?83.0:49.0) //底部tabbar高度
    
    static let kDeviceTopHeight : CGFloat = {
        return kDeviceToolStatue + kDeviceBarHeight
    }() //整个导航栏高度
    
    static let evnment : evn_config = .development
    
    static let k_main_url : String = {
        if (Config.evnment == .development) {
            return "development.cent"
        } else {
            return "lsajs"
        }
    }()
}


enum evn_config {
    case development
    case online
}



class StaticString {
    
    static let NAVI_HIDDEN = "naviHidden"
    
}
