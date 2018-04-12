//
//  PAOBasicModel.swift
//  PAOImages
//
//  Created by xsd on 2018/3/26.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import Foundation

class BasicModel: NSObject , NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! FilterModel
    }
}
