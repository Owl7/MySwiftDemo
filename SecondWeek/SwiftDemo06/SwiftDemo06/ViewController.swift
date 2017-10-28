//
//  ViewController.swift
//  SwiftDemo06
//
//  Created by Crack on 2017/10/25.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let collectionIdentifier = "collectionIdentifier"
    var collectionView: UICollectionView!
    
    lazy var imageArray: [String] = {
        
        var array: [String] = []
        
        for i in 1...10 {
            array.append("\(i).jpg")
        }
        
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = true
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -- SetupUI
    func setupUI() {
        setupCollectionView()
    }
    
    func setupCollectionView() {

        let collectionView =  UICollectionView(frame: CGRect.init(x: 0, y: 130, width: self.view.bounds.width, height: 400), collectionViewLayout: MyFlowLayout())
        collectionView.backgroundColor = UIColor.black
        collectionView.dataSource  = self
        collectionView.delegate = self
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: collectionIdentifier)
        self.view.addSubview(collectionView)
        
        self.collectionView = collectionView

    }

    // MARK: -- UICollectionViewDataSource, UICollectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.imageStr = imageArray[indexPath.item]
        return cell
    }
    
    
    
}










