//
//  ViewController.swift
//  SwiftDemo11
//
//  Created by Crack on 2017/11/4.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    let kScreenScale = UIScreen.main.bounds.width/320
    
    var collectionView: UICollectionView!
    
    lazy var imgArr: Array<String> = {
        var arr = [String]()
        for i in 1 ... 5 {
            let str = "\(i).jpg"
            arr.append(str)
        }
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: MyFlowLayout())
//        collectionView.backgroundColor = UIColor.white
//        collectionView.dataSource = self
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//
//        self.view.addSubview(collectionView)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: (kScreenW-5*3)/2, height: (kScreenW-5*3)/2 + (50 * kScreenScale))
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = .init(top: 5, left: 5, bottom: 5, right: 5)
        
        collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

extension ViewController: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let imageView = UIImageView.init(frame: cell.contentView.frame)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage.init(named: imgArr[indexPath.row])
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    
}










