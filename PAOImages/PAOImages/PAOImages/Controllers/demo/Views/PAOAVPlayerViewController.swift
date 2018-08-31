//
//  PAOAVPlayerViewController.swift
//  PAOImages
//
//  Created by xsd on 2018/8/10.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit


class PAOAVPlayerViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
        let url = URL.init(string: "http://image.yusi.tv/res/fileupload/file/02/20180207143107_993.mp4")
        let title = "测试视频"
        
        let playView = GFAVPlayerView(frame: self.view.frame, url: url,title:title)
        
        self.view.addSubview(playView)
        
    }


}
