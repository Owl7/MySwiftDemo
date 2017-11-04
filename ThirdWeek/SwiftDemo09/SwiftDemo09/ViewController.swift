//
//  ViewController.swift
//  SwiftDemo09
//
//  Created by Crack on 2017/10/31.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 屏幕高度
    let kScreenH = UIScreen.main.bounds.height
    // 屏幕宽度
    let kScreenW = UIScreen.main.bounds.width
    // 缩放比例
    let kScreenScale = UIScreen.main.bounds.width/320
    
    var collectionView: UICollectionView!
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI() {
        
        let layout = MyLayout()
        
        layout.itemSize = CGSize.init(width: (kScreenW-5*10)/4, height: (kScreenW-5*10)/4)
        layout.minimumInteritemSpacing = 0 * kScreenScale
        layout.minimumLineSpacing = 10 * kScreenScale
//        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerReferenceSize = CGSize.init(width: 0 * kScreenScale, height: 0 * kScreenScale)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 100, width: kScreenW, height: (((kScreenW-5*10)/4)*2)+10*3), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.green
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        self.view.addSubview(collectionView)
        
        collectionView .register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.red
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let label = UILabel()
        label.textAlignment = .center
        label.text = "\(indexPath.row)"
        label.frame = CGRect.init(x: 0, y: 0, width: cell.contentView.bounds.size.width, height: cell.contentView.bounds.size.height)
        cell.contentView.addSubview(label)
        
        return cell
    }
    
    
    
}

extension ViewController: UICollectionViewDelegate {
    
    
    
}





