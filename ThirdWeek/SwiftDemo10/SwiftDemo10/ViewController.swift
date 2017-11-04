//
//  ViewController.swift
//  SwiftDemo10
//
//  Created by Crack on 2017/11/4.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    
    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    
    lazy var imgArr:Array<String> = {
        var arr = [String]()
        for i in 1 ... 8 {
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
//        collectionView.delegate = self
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




