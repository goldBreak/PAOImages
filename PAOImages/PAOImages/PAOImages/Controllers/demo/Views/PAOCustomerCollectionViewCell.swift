//
//  PAOCustomerCollectionViewCell.swift
//  PAOImages
//
//  Created by xsd on 2018/8/10.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

class PAOCustomerCollectionViewCell: UICollectionViewCell {
    
    var imageView : UIImageView?
    var titleLable : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadUI()
        self.loadLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        
        self.imageView = UIImageView()
        self.titleLable = UILabel()
        self.titleLable?.font = UIFont.systemFont(ofSize: 12)
        self.titleLable?.textColor = UIColor.white
        self.titleLable?.textAlignment = NSTextAlignment.center
        
        self.contentView.addSubview(self.imageView!)
        self.contentView.addSubview(self.titleLable!)
    }
    
    func loadLayout() {
        
        self.imageView?.snp.makeConstraints({ (make) in
            make.left.right.top.bottom.equalTo(self.contentView)
        })
        
        self.titleLable?.snp.makeConstraints({ (make) in
            make.left.right.centerY.equalTo(self.contentView)
            make.height.equalTo(15)
        })
    }
}
