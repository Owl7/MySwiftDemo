//
//  MyLayout.swift
//  SwiftDemo011
//
//  Created by Crack on 2017/11/4.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class MyLayout: UICollectionViewLayout {

    var columnMargin: Int!        // 列间距
    var rowMargin: Int!           // 行间距
    var sectionInset: UIEdgeInsets! // collectionView边缘间距
    var columnCount: Int!           // 每列排几个
    
    /* 储存每一列item高度 */
    fileprivate var maxYDic: Dictionary<String, String> = Dictionary<String, String>()
    /* 储存item布局属性 */
    fileprivate var attrsArr: [UICollectionViewLayoutAttributes] = []
    
    override init() {
        super.init()
        columnMargin = 10
        rowMargin = 10
        sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        columnCount = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        
        super.prepare()
        
        // 清空最大Y值
        for i in 0 ..< columnCount {
            let column = "\(i)"
            maxYDic[column] = "\(sectionInset.top)"
        }
        
        // 计算所有item属性
        attrsArr.removeAll()
        let count = collectionView?.numberOfItems(inSection: 0)
        
        for i in 0 ..< count! {
            let attrs = layoutAttributesForItem(at: NSIndexPath.init(item: i, section: 0) as IndexPath)
            attrsArr.append(attrs!)
        }
        
    }
    
    // 设置collectionView滚动区域
    func collectionVIewContentSize() -> CGSize {

        
        var maxColumn = "0"
        for (column, maxY) in maxYDic {
            if (maxY as NSString).intValue > (maxYDic[maxColumn]! as NSString).intValue {
                maxColumn = column
            }
        }
        
        return CGSize.init(width: 0, height: CGFloat((maxYDic[maxColumn]! as NSString).floatValue) + sectionInset.bottom)
    }
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        var maxColumn = "0"
        for (column, maxY) in maxYDic {
            if (maxY as NSString).intValue > (maxYDic[maxColumn]! as NSString).intValue {
                maxColumn = column
            }
        }
        
        let width = (Int((collectionView?.frame.width)!) - columnMargin * (columnCount - 1) - Int(sectionInset.left) - Int(sectionInset.right)) / columnCount
        
        let height = 100
        
        let x: Int = Int(sectionInset.left) + Int((width + columnMargin)) * Int((maxColumn as NSString).intValue)
        let y: Int = Int((maxYDic[maxColumn]! as NSString).floatValue) + Int(rowMargin)
        
        maxYDic[maxColumn] = "\(y + height)"
        
        let att = layoutAttributesForItem(at: indexPath)
        
        att?.frame = CGRect.init(x: x, y: y, width: width, height: height)
        
        return att
    }
    
    // 允许每一次从新布局
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrsArr
    }
    
}






