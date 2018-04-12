//
//  UIView.swift
//  PAOImages
//
//  Created by xsd on 2018/3/26.
//  Copyright © 2018年 com.GF. All rights reserved.
//


import UIKit

extension UIView {
    public
    var minX : CGFloat {
        set (value) {
            var frame = self.frame
            frame.origin.x = value
            self.frame = frame
        }
        get {
            return self.frame.minX
        }
    }
    
    var maxX : CGFloat {
        
        get {
            return self.frame.maxX
        }
    }
    
    var minY : CGFloat {
        
        set (value) {
            var frame = self.frame
            frame.origin.y = value
            self.frame = frame
        }
        get {
            return self.frame.minY
        }
    }
    
    var maxY : CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    var width : CGFloat {
        get {
            return self.frame.width
        }
        set (value) {
            var frame = self.frame
            frame.size.width = value
            self.frame = frame
        }
    }
    
    var height : CGFloat {
        get {
            return self.frame.height
        }
        set (value) {
            var frame = self.frame
            frame.size.height = value
            self.frame = frame
        }
    }
    
    var size : CGSize {
        get {
            return self.frame.size
        }
        
        set (value) {
            var frame = self.frame
            frame.size = value
            self.frame = frame
        }
    }
    
    var snapshotImage : UIImage {
        //只读属性
        get {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0)
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return image
        }
    }
    
}
