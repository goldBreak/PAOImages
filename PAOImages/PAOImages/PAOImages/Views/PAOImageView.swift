//
//  PAOImageView.swift
//  PAOImages
//
//  Created by xsd on 2018/3/26.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit


class PAOImageView : UIView {
    
    private var _subImage : UIImage?
    private var _selected : Bool = false
    var image : UIImage? {
        set(value){
            _subImage = value
            self.layer.contents = _subImage?.cgImage
        }
        get {
            return _subImage
        }
    }
    
    var selected:Bool {
        
        set(value){
        
            _selected = value
            if _selected {
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.borderWidth = 1.0
            } else {
                self.layer.borderColor = UIColor.clear.cgColor
                self.layer.borderWidth = 0.0
            }
        }
        get {
            return _selected
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.layer.contains(point) {
            return self
        }
        return self.superview
    }
    
    private
    lazy var panGuesture = UIPanGestureRecognizer(target: self, action: #selector(PAOImageView.handlePanGuesture(recoginzer:)))
    
    lazy var tapGuesture : UITapGestureRecognizer = {
       let tapgurest = UITapGestureRecognizer(target: self, action: #selector(PAOImageView.handleTapGesture(regocinzer:)))
        tapgurest.numberOfTapsRequired = 2
        return tapgurest
    }()
    
    lazy var pinchGuesture = UIPinchGestureRecognizer(target: self, action: #selector(PAOImageView.handlePinchGuesture(recoginzer:)))
    
    var lazyFrame : CGRect = CGRect.zero
    
    private
    var isOpen = false
    
    init(image:UIImage,frame:CGRect) {
        
        super.init(frame: frame)
    
        self.image = image
        self.contentMode = UIViewContentMode.scaleAspectFit
        self.addGestureRecognizer(self.panGuesture)
        self.addGestureRecognizer(self.pinchGuesture)
        self.addGestureRecognizer(self.tapGuesture)
    }
    
    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTapGesture(regocinzer : UITapGestureRecognizer)  {
        //只有双击的时候，触发这个事件
        self.isOpen = !self.isOpen;
        if (self.isOpen) {
            //放大
            self.lazyFrame = self.frame;
            
            let point = regocinzer.location(in: self)
            var frame = self.frame;
            
            let width = point.x - frame.origin.x;
            let height = point.y - frame.origin.y;
            
            frame.origin.x -= width;
            frame.origin.y -= height;
            
            frame.size.width *= 2;
            frame.size.height *= 2;
            
            UIView.animate(withDuration: 0.2, animations: {
                self.frame = frame
            })
            
        } else {
            //缩小
            UIView.animate(withDuration: 0.2, animations: {
                self.frame = self.lazyFrame
            })
        }
    }
    
    @objc func handlePanGuesture(recoginzer:UIPanGestureRecognizer)  {
        //拖动手势！ 手势中暂时不让滑动到超出边界！
        
        if (recoginzer.state == UIGestureRecognizerState.changed) {
            //
            let offset = recoginzer.translation(in: self)
            
            var frame = self.lazyFrame;
            frame.origin.x += offset.x;
            frame.origin.y += offset.y;
            
            if (offset.x > 0) {
                //右滑,需要保证x 不能大于之前的位置
                if (frame.origin.x > 0) {

                    frame.origin.x = 0;
                }
            } else {
                //左滑,需要保证x 不能小于之前的位置
                if (frame.maxX < Config.kScreenWidth) {
                    if (frame.origin.x < 0) {
                        //这种情况下去做特殊处理
                        let preOriginX = frame.size.width - Config.kScreenWidth;
                        if (preOriginX < 0) {
                            frame.origin.x = 0;
                        } else {
                            frame.origin.x = -preOriginX;
                        }
                    }
                }
            }
            
            if (offset.y > 0) {
                //向下滑动 ，需要保证最大值不能超过之前的位置
                if (frame.origin.y > 0) {

                    frame.origin.y = 0;
                }
            } else {
                //向上滑动，需要保证最小值不能超过之前的位置
                if (frame.maxY < Config.kScreenHeight) {
                    if (frame.origin.y < 0) {
                        //这种情况下去做特殊处理
                        let preOriginY = frame.size.height - Config.kScreenHeight;
                        if (preOriginY < 0) {
                            frame.origin.y = 0;
                        } else {
                            frame.origin.y = -preOriginY;
                        }
                    }
                }
            }
            
            self.frame = frame;
            
        } else {
            self.lazyFrame = self.frame;
        }
    }
    
    @objc func handlePinchGuesture(recoginzer:UIPinchGestureRecognizer)  {
        //捏合手势！
        switch (recoginzer.state) {
        case .changed:
            //
            
                var frame = self.lazyFrame;
                frame.size.width *= recoginzer.scale;
                frame.size.height *= recoginzer.scale;
                
                frame.origin.x += (-frame.size.width + self.lazyFrame.size.width) / 2.0;
                frame.origin.y += (-frame.size.height + self.lazyFrame.size.height) / 2.0;
                self.frame = frame;
            
            break;
            
        default:
            self.lazyFrame = self.frame;
            break;
        }
    }
    
}
