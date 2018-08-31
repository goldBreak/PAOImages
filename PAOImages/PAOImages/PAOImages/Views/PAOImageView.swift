//
//  PAOImageView.swift
//  PAOImages
//
//  Created by xsd on 2018/3/26.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

@objc protocol PAOImageProtocol {
    
    func selfDidSelected(_ view:PAOImageView)
    @objc optional
    func longTagSelected(_ view: PAOImageView)
}

class PAOImageView : UIView {
    
    private var _subImage : UIImage?
    private var _selected : Bool = false
    weak var delegate : PAOImageProtocol?
    
    var image : UIImage? {
        set(value) {
            
            _subImage = value
            var size = _subImage!.size
            size.width *= _subImage!.scale
            size.height *= _subImage!.scale
            
            if size.width > frame.width || size.height > frame.height {
                let originScale = frame.height / frame.width
                let tempScale = _subImage!.size.height / _subImage!.size.width
                if originScale > tempScale {
                    //就是以宽为准
                    size = CGSize(width: frame.width, height: tempScale * frame.width)
                } else {
                    //以高为准
                    size = CGSize(width: frame.height/tempScale, height:frame.height)
                }
            }
            
            self.frame = CGRect(origin: self.frame.origin, size: size)
            
            //设置一下Image
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.selected = true
        
        if self.delegate != nil
        {
            self.delegate?.selfDidSelected(self)
        }
    }
    
    private
    lazy var panGuesture = UIPanGestureRecognizer(target: self, action: #selector(PAOImageView.handlePanGuesture(recoginzer:)))
    
    lazy var tapGuesture : UITapGestureRecognizer = {
       let tapgurest = UITapGestureRecognizer(target: self, action: #selector(PAOImageView.handleTapGesture(regocinzer:)))
        tapgurest.numberOfTapsRequired = 2
        return tapgurest
    }()
    
    lazy var longPressGuesture: UILongPressGestureRecognizer = {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(PAOImageView.handleLongPress(recoginzer:)))
        return longPress
    }()
    
    lazy var pinchGuesture = UIPinchGestureRecognizer(target: self, action: #selector(PAOImageView.handlePinchGuesture(recoginzer:)))
    
    var lazyFrame : CGRect = CGRect.zero
    
    private
    var isOpen = false
    
    init(image:UIImage,frame:CGRect) {
        //创建size
        
        var size = image.size
        size.width *= image.scale
        size.height *= image.scale
        if size.width > frame.width || size.height > frame.height {
            let originScale = frame.height / frame.width
            let tempScale = image.size.height / image.size.width
            if originScale > tempScale {
                //就是以宽为准
                size = CGSize(width: frame.width, height: tempScale * frame.width)
            } else {
                //以高为准
                size = CGSize(width: frame.height/tempScale, height:frame.height)
            }
        }
        super.init(frame: CGRect(origin: CGPoint.zero, size: size))
        
        //set frame
        self.image = image
        self.contentMode = UIViewContentMode.scaleAspectFit
        self.addGestureRecognizer(self.panGuesture)
        self.addGestureRecognizer(self.pinchGuesture)
        self.addGestureRecognizer(self.tapGuesture)
        self.addGestureRecognizer(self.longPressGuesture)
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
    
    @objc func handleLongPress(recoginzer : UILongPressGestureRecognizer){
        if recoginzer.state == UIGestureRecognizerState.ended {
            if self.delegate != nil
            {
                self.delegate?.longTagSelected?(self)
            }
        }
    }
    
}
