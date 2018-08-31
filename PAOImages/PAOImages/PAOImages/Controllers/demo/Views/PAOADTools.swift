//
//  PAOADTools.swift
//  PAOImages
//
//  Created by xsd on 2018/7/4.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit
import SnapKit

protocol toolsValueChangedProtocol {
    
    func toolsValueChanged(toolsView:PAOADTools,value:Any)
}

class PAOADTools: UIView {
    
    var rValue : Float = 255.0
    var gValue : Float = 255.0
    var bValue : Float = 255.0
    var aValue : Float = 1.0
    
    var delegate:toolsValueChangedProtocol?
    
    lazy var rSilder:PAOSlider = {
        let slider = PAOSlider(frame: CGRect.zero);
        slider.maxValue = 255
        slider.minValue = 0
        slider.delegate = self
        slider.type = .R
        return slider;
    }()
    
    lazy var gSilder:PAOSlider = {
        let slider = PAOSlider(frame: CGRect.zero);
        slider.maxValue = 255
        slider.minValue = 0
        slider.delegate = self
        slider.type = .G
        return slider;
    }()
    
    lazy var bSilder:PAOSlider = {
        let slider = PAOSlider(frame: CGRect.zero);
        slider.maxValue = 255
        slider.minValue = 0
        slider.delegate = self
        slider.type = .B
        return slider;
    }()
    
    lazy var aSilder:PAOSlider = {
        let slider = PAOSlider(frame: CGRect.zero);
        slider.maxValue = 255
        slider.minValue = 0
        slider.delegate = self
        slider.type = .A
        return slider;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.rSilder)
        self.addSubview(self.gSilder)
        self.addSubview(self.bSilder)
        self.addSubview(self.aSilder)

        self.rSilder.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.height.equalTo(10)
        }
        
        self.gSilder.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.rSilder.snp.bottom).offset(4)
            make.height.equalTo(10)
        }

        self.bSilder.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.gSilder.snp.bottom).offset(4)
            make.height.equalTo(10)
        }
        
        self.aSilder.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.gSilder.snp.bottom).offset(4)
            make.height.equalTo(10)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PAOADTools:SliderValueChanged {
    
    func sliderValueDidChanged(value: Float, slider: PAOSlider) {
        //
        if slider.isEqual(self.rSilder) {
            //R..
            self.aValue = value
        } else if slider.isEqual(self.gSilder) {
            //G
            self.gValue = value
        } else if slider.isEqual(self.bSilder) {
            //B
            self.bValue = value
        } else if slider.isEqual(self.aSilder) {
            //A
            self.aValue = value
        }
        
        if self.delegate != nil {
            self.delegate!.toolsValueChanged(toolsView: self, value: UIColor(red: CGFloat(self.aValue/255.0), green: CGFloat(self.gValue/255.0), blue: CGFloat(self.bValue/255.0), alpha: CGFloat(self.aValue)))
        }
    }
    
}
