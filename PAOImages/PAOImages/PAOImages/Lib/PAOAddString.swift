//
//  PAOAddString.swift
//  PAOImages
//
//  Created by xsd on 2018/4/10.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

extension String {
    func subString(with nsrang : NSRange) -> String? {
        guard let range = Range(nsrang,in:self) else {
           return nil
        }
        return String(self[range])
    }
}
