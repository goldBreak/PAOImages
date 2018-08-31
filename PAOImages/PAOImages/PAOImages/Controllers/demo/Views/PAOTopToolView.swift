//
//  PAOTopToolView.swift
//  PAOImages
//
//  Created by xsd on 2018/4/9.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

protocol toolSelectedProtocol  {
    func itemDidSelected(selName:String)
}

class PAOTopToolView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let cellFlag : String = "cellFlag"
    
    var delegate:toolSelectedProtocol?
    
    init() {
        //
        let frame = CGRect(x: 0.0, y: 0.0, width: Config.kScreenWidth, height: Config.kDeviceTopHeight)
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.addSubview(self.menues)
        self.addSubview(self.moreBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //more action
    @objc func moreItems(button:UIButton) {
        
        button.isSelected = !button.isSelected
        
    }
    
    //makr-delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //点击事件
        self.delegate?.itemDidSelected(selName:self.toolNameArrat[indexPath.row] as! String)
    }
    
    //mark - dataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.toolNameArrat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:PAOToolCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellFlag, for: indexPath) as! PAOToolCollectionViewCell
        
        cell.titleLable.text = (self.toolNameArrat[indexPath.row] as! String)
        
        return cell
    }
    
    //instance...
    lazy var menues : UICollectionView = {
        var frame = self.frame;
        frame.size.width -= 44;
        frame.origin.y = Config.kDeviceToolStatue
        frame.size.height -= Config.kDeviceToolStatue
        
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: Config.kDeviceToolStatue)
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 5.0;
        
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        var collection = UICollectionView(frame: frame, collectionViewLayout: layout);
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.clear
        collection.register(PAOToolCollectionViewCell.self, forCellWithReuseIdentifier: cellFlag)
        return collection;
    }()
    
    lazy var moreBtn : UIButton = {
        
        var button = UIButton(type: UIButtonType.custom)
        button.setTitle("more", for: UIControlState.normal)
        button.setTitle("done", for: UIControlState.selected)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11.0)
        button.addTarget(self, action: #selector(self.moreItems(button:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: self.menues.maxX, y: self.menues.minY, width: 44, height: self.menues.height)
        
        return button;
    }()
    
    
    var toolNameArrat : NSArray = ["相册","相机","保存","取消选中"] /* 撤销暂时不做！ !*/ /* 留下可扩展的空间 !*/
    
    //tools
}
