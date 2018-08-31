//
//  PAOMessageViewController.swift
//  PAOImages
//
//  Created by xsd on 2018/4/9.
//  Copyright © 2018年 com.GF. All rights reserved.


import UIKit

class PAOMessageViewController: PAOBasicViewController,toolSelectedProtocol {

    var currentSelectedTag = -1
    var currentSelectedImage:PAOImageView?
    
    //主要存储图画层层
    var imageViewArray:NSMutableArray = NSMutableArray()
    
    //工作区域
    lazy var contentView : UIView = {
        
        var frame = CGRect(x: 0, y: self.toolView.maxY + 20.0, width: Config.kScreenWidth, height: Config.kScreenHeight - self.toolView.maxY - 20.0)
        
        var view = UIView(frame: frame)
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.lightGray
        return view;
    }()
    
   lazy var toolView : PAOTopToolView! = {
        var view = PAOTopToolView();
        view.delegate = self
        return view;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.configDic = [StaticString.NAVI_HIDDEN:false]
        
        self.view.addSubview(self.toolView)
        self.view.addSubview(self.contentView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //#param : 设置图片
    func setImage(with image:UIImage) {
    
        if self.currentSelectedTag == -1 {
        
            //创建一个新的item
            let imageView = PAOImageView(image: image,frame: self.contentView.bounds)
            imageView.selected = true
            imageView.delegate = self
            self.imageViewArray.add(imageView)
            self.currentSelectedTag = self.imageViewArray.count-1
            self.contentView.addSubview(imageView)
            self.currentSelectedImage?.selected = false
            self.currentSelectedImage = imageView
        } else {
            //直接赋值
            self.currentSelectedImage?.image = image
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentSelectedImage?.selected = false
        self.currentSelectedTag = -1
    }
}

//点击事件和长按事件
extension PAOMessageViewController : PAOImageProtocol {
    
    func selfDidSelected(_ view: PAOImageView) {
        if self.currentSelectedImage != nil {
            self.currentSelectedImage?.selected = false
        }
        self.currentSelectedImage = view
        self.currentSelectedTag = self.imageViewArray.indexOfObjectIdentical(to: view)
        self.currentSelectedImage?.selected = true
        self.contentView.insertSubview(self.currentSelectedImage!, aboveSubview: self.contentView.subviews.last!)
    }
    
    func longTagSelected(_ view: PAOImageView) {
        //跳转到edit页面
        let editImageVC = PAOEditViewController()
        editImageVC.originImage = self.currentSelectedImage?.image
        self.navigationController?.pushViewController(editImageVC, animated: true)
    }
}


extension PAOMessageViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    //toolSelectedProtocol
    func itemDidSelected(selName: String) {
        if selName.elementsEqual("相册") {
            //添加文件
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = .photoLibrary
            self.present(imagePick, animated: true, completion: nil)
        } else if selName.elementsEqual("相机"){
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = .camera
            self.present(imagePick, animated: true, completion: nil)
        } else if selName.elementsEqual("取消选中"){
            if self.currentSelectedImage != nil {
                self.currentSelectedImage?.selected = false
            }
            self.currentSelectedImage = nil
            self.currentSelectedTag = -1
        }
    }
    
    
    //image
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.dismiss(animated: true) {
            let image : UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.setImage(with: image.normalized())
        };
    }
    
    
}
