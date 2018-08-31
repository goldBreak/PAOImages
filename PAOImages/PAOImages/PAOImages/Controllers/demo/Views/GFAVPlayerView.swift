//
//  GFAVPlayerView.swift
//  PAOImages
//
//  Created by xsd on 2018/8/10.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

let timeDuration = 0.7

//这儿高度封装了播放在线视频播放器，
class GFAVPlayerView: UIView {
    
    //
    var avPlayer : AVPlayer?
    var playerItem : AVPlayerItem?
    var playerLayer : AVPlayerLayer?
    var urlAsset : AVURLAsset?
    
    var currentTime : Int = 0
    var maxTime : Int = 0
    
    var isReadForPlay : Bool = false
    var isFailure : Bool = false
    
    //计时器，点击播放之后，0.5秒后消失状态栏
    var time : Timer?
    
    var naviToolView : UIView!
    //返回按钮
    var backBtn : UIButton!
    //静音按钮
    var voiceControlBtn : UIButton!
    var titleLable : UILabel!
    
    //屏幕中央的大播放按钮
    var bigPlayControlBtn : UIButton!
    
    //下面的控制view
    var toolView : UIView!
    var littlePlayControlBtn : UIButton!
    var timeLable : UILabel!
    var progress : UISlider!
    
    var totalTimeStr : String = ""
    
    var timeObserve : Any?
    
    
    
    init(frame: CGRect,url : URL?,title : String) {
        
        super.init(frame: frame)
        //
        guard url != nil  else {
            print("视频地址不能为空，你传入的地址是"+(url?.absoluteString)!)
            return
        }
        self.urlAsset = AVURLAsset.init(url: url!)
        
        self.backgroundColor = UIColor.black
        
        self.playerItem = AVPlayerItem.init(asset: self.urlAsset!)
        
        
        self.avPlayer = AVPlayer(playerItem: self.playerItem)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bigBtnPress(gester:)))
        self.addGestureRecognizer(tapGesture)
        
        self.loadUI()
        self.loadLayout()
        
        self.playerItem?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        
        self.titleLable.text = title
        
        self.addTimeObserve()
        
        self.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        self.frame = frame
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //action
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "status" {

            switch (self.playerItem!.status) {
            case .unknown:
                self.isFailure = false
                self.isReadForPlay = false
                break
            case .readyToPlay:
                self.isFailure = false
                self.isReadForPlay = true
                self.progress.maximumValue = Float(self.playerItem!.duration.value / Int64(self.playerItem!.duration.timescale))
                
                let min:Int = Int(self.progress.maximumValue) / 60
                let second:Int = Int(self.progress.maximumValue) % 60
                self.totalTimeStr = String.init(format: "%02d:%02d", min,second)
                
                self.timeLable.text = "0.00:"+self.totalTimeStr
                break
            case .failed:
                self.isFailure = true
                self.isReadForPlay = false
                print("地址链接错误错误")
                break
            }
        }
    }
    
    @objc func back()  {
        //back
    }
    
    @objc func voiceControl(button:UIButton) {
        //控制静音按钮
        
        button.isSelected = !button.isSelected
        
        if button.isSelected {
            self.avPlayer?.volume = 0.0
        } else {
            self.avPlayer?.volume = 1.0
        }
        
    }
    
    //计算时间
    func addTimeObserve() {
        self.timeObserve = self.avPlayer?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: nil, using: { (time) in
            let item = self.playerItem
            
            let currentTime = (item?.currentTime().value)!/Int64(item!.currentTime().timescale)
            self.progress.value = Float(currentTime)
            let min = currentTime / 60
            let second = currentTime % 60
            
            let str : String = String.init(format: "%02d:%02d", min,second)
            
            self.timeLable.text = "\(str)/\(self.totalTimeStr)"
        })
        
    }
    
    @objc func bigBtnPress(gester:UITapGestureRecognizer){
        
        //大的播放按钮点击事件
        if self.isReadForPlay {
            self.bigPlayControlBtn.isSelected = !self.bigPlayControlBtn.isSelected
            self.littlePlayControlBtn.isSelected = self.bigPlayControlBtn.isSelected
            
            if(self.bigPlayControlBtn.isSelected) {
                self.bigPlayControlBtn.isHidden = true
                self.play()
            } else {
                self.pause()
            }
        }
    }
    
    @objc func littleBtnPress(button:UIButton) {
        //小的播放按钮点击事件
        if self.isReadForPlay {
            
            self.littlePlayControlBtn.isSelected = !self.littlePlayControlBtn.isSelected
            self.bigPlayControlBtn.isSelected = self.littlePlayControlBtn.isSelected
            if self.littlePlayControlBtn.isSelected {
                self.bigPlayControlBtn.isHidden = true
                self.play()
            } else {
                self.pause()
            }
        }
    }
    
    
    @objc func hiddenTool() {
        self.toolView.isHidden = true
        
        self.naviToolView.isHidden = true
    }
    
    @objc func showHiddenTool() {
        self.toolView.isHidden = false
        self.bigPlayControlBtn.isHidden = false
        self.naviToolView.isHidden = false
    }
    
    
    //播放▶️
    func play() {
        self.avPlayer?.play()
        if self.time != nil {
            self.time?.invalidate()
            self.time = nil
        }
        
        self.time = Timer(timeInterval: timeDuration, target: self, selector: #selector(hiddenTool), userInfo: nil, repeats: false)
        self.time?.fire()
    }
    
    //暂停⏸
    func pause() {
        self.avPlayer?.pause()
        
        self.showHiddenTool()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.playerLayer?.frame = CGRect(x: 0, y: 0, width: self.height, height: self.width)
    }
    
    //load ui
    func loadUI()  {
        
        self.playerLayer = AVPlayerLayer(player: self.avPlayer)
    
        self.layer.addSublayer(self.playerLayer!)
        
        self.naviToolView = UIView()
        self.naviToolView.backgroundColor = UIColor.init(white: 0.2, alpha: 0.4)
        self.addSubview(self.naviToolView)
        
        self.backBtn = UIButton(type: .custom)
        self.backBtn.setTitle("返回", for: .normal)
        self.backBtn.setTitleColor(UIColor.white, for: .normal)
        self.backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.naviToolView.addSubview(self.backBtn)
        
        self.titleLable = UILabel()
        self.titleLable.font = UIFont.systemFont(ofSize: 14)
        self.titleLable.textColor = UIColor.white
        self.naviToolView.addSubview(self.titleLable)
        
        self.voiceControlBtn = UIButton(type: .custom)
        self.voiceControlBtn.setTitle("正常", for: .normal)
        self.voiceControlBtn.setTitle("静音", for: .selected)
        self.voiceControlBtn.setTitleColor(UIColor.white, for: .normal)
        self.voiceControlBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.voiceControlBtn.addTarget(self, action: #selector(voiceControl(button:)), for: .touchUpInside)
        self.naviToolView.addSubview(self.voiceControlBtn)
        
        //这儿应该用一个图片，懒得换了
        self.bigPlayControlBtn = UIButton(type: .custom)
        self.bigPlayControlBtn.setTitleColor(UIColor.white, for: .normal)
        self.bigPlayControlBtn.setTitleColor(UIColor.white, for: .selected)
        self.bigPlayControlBtn.setTitle("暂停", for: .normal)
        self.bigPlayControlBtn.setTitle("播放", for: .selected)
        self.bigPlayControlBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.bigPlayControlBtn.isEnabled = false
        self.addSubview(self.bigPlayControlBtn)
        
        self.toolView = UIView()
        //黑色的半透明控制层
        self.toolView.backgroundColor = UIColor.init(white: 0.2, alpha: 0.4)
        self.addSubview(self.toolView)
        
        //下面的控件都加到tooview
        self.littlePlayControlBtn = UIButton(type: .custom)
        self.littlePlayControlBtn.setTitle("播放", for: .selected)
        self.littlePlayControlBtn.setTitle("暂停", for: .normal)
        self.littlePlayControlBtn.setTitleColor(UIColor.white, for: .normal)
        self.littlePlayControlBtn.setTitleColor(UIColor.white, for: .selected)
        self.littlePlayControlBtn.titleLabel?.font = UIFont.systemFont(ofSize: 6)
        self.toolView.addSubview(self.littlePlayControlBtn)
        
        self.progress = UISlider()
        self.progress.backgroundColor = UIColor.init(white: 0.6, alpha: 1)
        self.progress.thumbTintColor = UIColor.init(white: 0.8, alpha: 1)
        self.progress.maximumValue = 1.0
        self.progress.value = 0.4
        self.toolView.addSubview(self.progress)
        
        self.timeLable = UILabel()
        self.timeLable.textColor = UIColor.white
        self.timeLable.font = UIFont.systemFont(ofSize: 6)
        self.timeLable.text = "--:--/--:--"
        self.toolView.addSubview(self.timeLable)
    }
    
    func loadLayout()  {
        //
        self.playerLayer?.frame = self.frame;
        
        self.naviToolView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(40)
        }
        
        self.backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.naviToolView).offset(15)
            make.top.bottom.equalTo(self.naviToolView)
            make.width.equalTo(100)
        }
        
        self.voiceControlBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.naviToolView).offset(-15)
            make.width.equalTo(30)
            make.centerY.equalTo(self.backBtn)
        }
        
        self.titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.backBtn.snp.right).offset(10)
            make.right.equalTo(self.voiceControlBtn.snp.left).offset(-10)
            make.top.height.equalTo(self.naviToolView)
        }
        
        self.bigPlayControlBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(self)
        }
        
        self.toolView.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.left.bottom.right.equalTo(self)
        }
        
        self.littlePlayControlBtn.snp.makeConstraints { (make) in
            make.left.centerY.equalTo(self.toolView)
            make.width.height.equalTo(30)
        }
        
        self.timeLable.snp.makeConstraints { (make) in
            make.right.equalTo(self.toolView).offset(-15)
            make.bottom.top.equalTo(self.toolView)
            make.width.equalTo(60)
        }
        self.progress.snp.makeConstraints { (make) in
            make.left.equalTo(self.littlePlayControlBtn.snp.right).offset(10)
            make.right.equalTo(self.timeLable.snp.left).offset(-10)
            make.centerY.equalTo(self.timeLable)
            make.height.equalTo(4)
        }
    }
}
