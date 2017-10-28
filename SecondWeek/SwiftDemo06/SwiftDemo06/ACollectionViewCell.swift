//
//  ACollectionViewCell.swift
//  SwiftDemo06
//
//  Created by Crack on 2017/10/29.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ACollectionViewCell: UICollectionViewCell {
    
    var ainterest: AInterest! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    fileprivate func updateUI() {
        interestTitleLabel?.text! = ainterest.title
        featuredImageView?.image! = ainterest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
}
