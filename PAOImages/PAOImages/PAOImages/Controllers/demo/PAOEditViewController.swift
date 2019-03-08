//
//  PAOEditViewController.swift
//  PAOImages
//
//  Created by xsd on 2018/6/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

import UIKit

class PAOEditViewController: PAOBasicViewController {

    var contentView : PAOImageView!
    var originImage : UIImage?
    
    var dataSurce:NSMutableArray = NSMutableArray()
    
    
    lazy var collectionView : UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 90)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        
        var collView = UICollectionView(frame: CGRect(x: 0, y: self.view.height-90.0, width: self.view.width, height: 90), collectionViewLayout: layout)
        collView.delegate = self
        collView.dataSource = self
        
        return collView
    }()
    
    
    //工作区域
    lazy var bgView : UIView = {
        
        var frame = CGRect(x: 0, y: Config.kDeviceTopHeight, width: Config.kScreenWidth, height: Config.kScreenHeight - Config.kDeviceTopHeight - 140.0)
        
        var view = UIView(frame: frame)
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.lightGray
        return view;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
//        let rightButton
        let image : UIImage = (self.originImage!.ciCategoryColorEffect())!;
        
        self.view.addSubview(self.bgView);
        self.contentView = PAOImageView(image: image, frame: self.view.frame)
        self.contentView.selected = true
        self.bgView.addSubview(self.contentView)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false);
    }
    
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension PAOEditViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSurce.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellFlag = "cellFlag"
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellFlag, for: indexPath)
        
        return cell
    }
    
}
