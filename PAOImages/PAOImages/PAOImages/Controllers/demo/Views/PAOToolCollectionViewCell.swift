//
//  PAOToolCollectionViewCell.swift
//  PAOImages
//
//  Created by xsd on 2018/4/9.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

class PAOToolCollectionViewCell: UICollectionViewCell {
    var titleLable : UILabel = {
        var lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 11.0)
        lable.textColor = UIColor.black
        lable.textAlignment = NSTextAlignment.center
        
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear;
        self.contentView.addSubview(self.titleLable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLable.frame = self.bounds
    }
}
