//
//  PAOEditViewController.swift
//  PAOImages
//
//  Created by xsd on 2018/6/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

class PAOEditViewController: UIViewController {

    var contentView : PAOImageView!
    var originImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.automaticallyAdjustsScrollViewInsets = false
        // add subView
        self.contentView = PAOImageView(image: self.originImage!, frame: self.view.frame)
        self.view.addSubview(self.contentView)
        
    }

}
