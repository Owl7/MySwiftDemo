//
//  MyFlowLayout.swift
//  SwiftDemo11
//
//  Created by Crack on 2017/11/4.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class MyFlowLayout: UICollectionViewLayout {
    
    // 显示几行
    let rowCount: UInt = 2
    // 一行多少个
    let itemCountRow: UInt = 4
    // 保存所有item
    fileprivate var attributesArr: [UICollectionViewLayoutAttributes] = []
    
    override init() {
        super.init()
        
        
    }
    
    override func prepare() {
        super.prepare()
        
        let count = self.collectionView?.numberOfItems(inSection: 0)
        for i in 0..<count! {
            let indexPath = NSIndexPath.init(item: i, section: 0)
            let attributes = self.layoutAttributesForItem(at: indexPath as IndexPath)
            self.attributesArr.append(attributes!)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collectionViewContentSize: CGSize {
        return super.collectionViewContentSize
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let item = UInt(indexPath.item)
        
        let page = item / (itemCountRow * rowCount)
        
        let x = item % itemCountRow + page * itemCountRow
        let y = item / itemCountRow - page * rowCount
        
        let newItem = x * rowCount + y
        
        let newIndexPath = NSIndexPath.init(item: Int(newItem), section: indexPath.section)
        
        let newAttr = super.layoutAttributesForItem(at: newIndexPath as IndexPath)
        newAttr?.indexPath = indexPath
        
        return newAttr
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attrs = super.layoutAttributesForElements(in: rect)
        var tmp:[UICollectionViewLayoutAttributes] = []
        
        for attr in attrs! {
            for attr2 in self.attributesArr {
                if attr.indexPath.item == attr2.indexPath.item {
                    tmp.append(attr2)
                    break;
                }
            }
        }
        return tmp
    }

}
