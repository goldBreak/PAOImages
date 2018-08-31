//
//  PAOAddCGFLoat.swift
//  PAOImages
//
//  Created by xsd on 2018/4/10.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

extension CGFloat {

    static func strTransfom(with str:String) -> CGFloat {
        var hexComponent : UInt32 = 0
        Scanner(string: str).scanHexInt32(&hexComponent)
        let doubleNumber : Double = Double(hexComponent)
        return CGFloat(doubleNumber)
    }
}
