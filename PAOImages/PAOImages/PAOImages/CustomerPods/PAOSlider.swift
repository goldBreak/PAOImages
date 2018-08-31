//
//  PAOSlider.swift
//  PAOImages
//
//  Created by xsd on 2018/7/4.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit
import SnapKit

protocol SliderValueChanged {
    
    func sliderValueDidChanged(value:Float, slider:PAOSlider)
}

enum SliderType {
    case R
    case G
    case B
    case A
    case Others
}

class PAOSlider: UIView {
    
    lazy var slider : UISlider = {
        
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
        
        slider.maximumValue = self.maxValue
        slider.minimumValue = self.maxValue
        slider.backgroundColor = UIColor.hex(string: "990203")
        slider.tintColor = UIColor.blue
        slider.addTarget(self, action: #selector(sliderValueChanger(slider:)), for: UIControlEvents.valueChanged)
       return slider
    }()
    
    var type:SliderType {
        
        get {
            return self.type
        }
        
        set(value) {
            switch value {
            case .R:
                self.slider.thumbTintColor = UIColor.red
                break
            case .G:
                self.slider.thumbTintColor = UIColor.green
                break
            case .B:
                self.slider.thumbTintColor = UIColor.blue
                break
            default:
                self.slider.thumbTintColor = UIColor.white
            }
        }
    }
    
    var delegate:SliderValueChanged?

    var valueInput : UITextField = {
        
        let valueInput = UITextField()
        
        valueInput.keyboardType = UIKeyboardType.numberPad
        valueInput.layer.borderColor = UIColor.hex(string: "#eeeeee")?.cgColor
        valueInput.layer.borderWidth = 0.5
        
       return valueInput
    }()
    
    @objc func sliderValueChanger(slider:UISlider) {
        self.valueInput.text = "\(slider.value)"
        self.delegate?.sliderValueDidChanged(value: slider.value, slider: self)
    }
    
    //default can change
    var maxValue : Float = 1.0
    var minValue : Float = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.type = .Others
        
        self.addSubview(self.slider)
        self.addSubview(self.valueInput)
        
        self.slider.snp.makeConstraints { (make) in
            make.left.top.height.equalTo(self)
            make.right.equalTo(self).offset(-50)
        }

        self.valueInput.snp.makeConstraints { (make) in
            make.top.height.equalTo(self.slider)
            make.left.equalTo(self.slider.snp.right)
            make.right.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
