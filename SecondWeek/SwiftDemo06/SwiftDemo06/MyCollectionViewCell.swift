//
//  MyCollectionViewCell.swift
//  SwiftDemo06
//
//  Created by Crack on 2017/10/25.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    var imageStr: String? {
        didSet {
            imageView?.image = UIImage.init(named: imageStr!)
            print(imageStr)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView()
        self.imageView?.layer.borderColor = UIColor.white.cgColor
        self.imageView?.layer.borderWidth = 3
        self.imageView?.layer.cornerRadius = 3
        self.imageView?.clipsToBounds = true
        
        self.addSubview(self.imageView!)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
