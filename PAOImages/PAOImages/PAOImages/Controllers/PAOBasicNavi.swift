//
//  PAOBasicNavi.swift
//  PAOImages
//
//  Created by xsd on 2018/3/26.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit




class PAOBasicNaviController: UINavigationController,UINavigationControllerDelegate {
    //basic
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: PAOBasicViewController, animated: Bool) {
        //这儿填写!
        let dict = viewController.configDic
        if dict != nil {
            
        }
        
    }
}
