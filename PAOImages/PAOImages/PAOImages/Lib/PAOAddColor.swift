//
//  PAOAddColor.swift
//  PAOImages
//
//  Created by xsd on 2018/4/10.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

extension UIColor {

    public
    
    var r : CGFloat {
        get {
            return self.rgbComponents.r
        }
    }
    
    var g : CGFloat {
        get {
            return self.rgbComponents.g
        }
    }
    
    var b : CGFloat {
        get {
            return self.rgbComponents.b
        }
    }
    
    var a : CGFloat {
        get {
            return self.rgbComponents.a
        }
    }
    
    static func hex(string:String) -> UIColor? {
       
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        
        if hexStrToRGBA(str: string, r: &r, g: &g, b: &b, a: &a) {
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
        
        return nil
    }
    
    private
    //获取RGBA的颜色
    var rgbComponents:(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
    
        var r : CGFloat = 0.0
        var g : CGFloat  = 0.0
        var b : CGFloat  = 0.0
        var a : CGFloat  = 0.0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r,g,b,a)
        } else {
            return (0.0,0.0,0.0,0.0)
        }
    }
    
    class func hexStrToRGBA(str:String, r : inout CGFloat, g: inout CGFloat, b :inout CGFloat , a : inout CGFloat) -> Bool {
        var newStr = str.trimmingCharacters(in: CharacterSet.whitespaces).uppercased()
        //去掉#，去掉0x
        newStr = newStr.replacingOccurrences(of: "#", with: "")
        newStr = newStr.replacingOccurrences(of: "0X", with: "")
        
        let length = newStr.count
        //      0x123            0x1231        0x112233       0x11223311
        //      RGB              RGBA           RRGGBB        RRGGBBAA
        if length != 3 && length != 4 && length != 6 && length != 8 {
            return false
        }
        if length < 5 {
            
            r = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 0, length: 1))!) / 255.0
            g = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 1, length: 1))!) / 255.0
            b = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 2, length: 1))!) / 255.0
            
            if length == 4 {
                a = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 3, length: 1))!) / 255.0
            } else {
                a = 1.0
            }
        } else {
            
            r = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 0, length: 2))!) / 255.0
            g = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 2, length: 2))!) / 255.0
            b = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 4, length: 2))!) / 255.0
            
            if length == 8 {
                a = CGFloat.strTransfom(with: newStr.subString(with: NSRange(location: 6, length: 2))!) / 255.0
            } else {
                a = 1.0
            }
        }
        
        return true
    }
}
