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
        
        let doubleNumber : Double = Double(str)!
        return CGFloat(doubleNumber)
    }
}
