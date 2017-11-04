//
//  ViewController.swift
//  SwiftDemo13
//
//  Created by Crack on 2017/11/4.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit
import pop

class ViewController: UIViewController, CAAnimationDelegate {
    
    var collectionView: UICollectionView!
    
    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    
    var bgview: UIView!
    var imageView: UIImageView!
    
    lazy var imgArr:Array<String> = {
        var arr = [String]()
        for i in 1 ... 6 {
            let str = "\(i).jpg"
            arr.append(str)
        }
        return arr
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "collectionView"
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: (kScreenW-10*3)/2, height: (kScreenW-10*3)/2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: cell.contentView.bounds.width, height: cell.contentView.bounds.height))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage.init(named: imgArr[indexPath.row])
        
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        imageView = UIImageView.init(frame: self.view.frame)
        imageView.backgroundColor = UIColor.white
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage.init(named: "\(indexPath.row + 1).jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.tag = indexPath.row
        self.view.addSubview(imageView)
        
        let gr = UITapGestureRecognizer()
        gr.numberOfTapsRequired = 1
        gr.addTarget(self, action: #selector(clickBgView))
        imageView.addGestureRecognizer(gr)
        
        if let anim = POPSpringAnimation(propertyNamed: kPOPLayerPosition) {
            anim.fromValue = NSValue(cgRect: CGRect(x: (cell?.center.x)!, y: (cell?.center.y)!, width: 0, height: 0))
            imageView.layer.pop_add(anim, forKey: "size")
        }
//
        print(self.view.subviews.count)
        
//        ==========================
        
//        移除self.mineTopView.layer上的所有动画，可以避免多次重复添加
//        imageView.layer.removeAllAnimations()
//        let momAnimation = CABasicAnimation(keyPath: "transform.scale")
//        momAnimation.fromValue = NSNumber(value: -0.1) //左幅度
//        momAnimation.toValue = NSNumber(value: 0.1) //右幅度
//        momAnimation.duration = 0.1
//        momAnimation.repeatCount = HUGE //无限重复
//        momAnimation.autoreverses = true //动画结束时执行逆动画
//        momAnimation.isRemovedOnCompletion = false //切出此界面再回来动画不会停止
//
//        momAnimation.delegate = self//CAAnimationDelegate 代理中有动画的开始和结束
//        imageView.layer.add(momAnimation, forKey: "shadowRadius")
        
//        ====================
        
//        let animation = CABasicAnimation.init(keyPath: "transform.scale")
//        animation.duration = 1.0
//        animation.repeatCount = HUGE
//        animation.autoreverses = true
//
//        animation.fromValue = 0.9
//        animation.toValue = 1.1
//
//        imageView.layer.animation(forKey: "scale-layer")
        
//        UIView.animate(withDuration: 1, animations: {
//            self.imageView.center = self.bgview.center
//        }) { (finished: Bool) in
//
//        }
        
    }
    
    @objc func clickBgView(gr: UITapGestureRecognizer) {

//        let indexPath = NSIndexPath.init(item: (gr.view?.tag)!, section: 0)
//
//        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
        
//        imageView.removeFromSuperview()
//        imageView.layer.pop_removeAllAnimations()
        
        if let anim = POPSpringAnimation(propertyNamed: kPOPLayerBounds) {
            anim.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 0, height: 0))
            self.imageView.layer.pop_add(anim, forKey: "size")
        }
        
        let deadlineTime = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.imageView.removeFromSuperview()
//            self.imageView.layer.pop_removeAllAnimations()
        }
        
//        UIView.animate(withDuration: 1, animations: {
//            if let anim = POPSpringAnimation(propertyNamed: kPOPLayerBounds) {
//                anim.toValue = NSValue(cgRect: CGRect(x: (cell?.center.x)!, y: (cell?.center.y)!, width: 0, height: 0))
//                self.imageView.layer.pop_add(anim, forKey: "size")
//            }
//        }) { (finished: Bool) in
//            if finished {
//                self.imageView.removeFromSuperview()
//            }
//        }

    }
    
}











