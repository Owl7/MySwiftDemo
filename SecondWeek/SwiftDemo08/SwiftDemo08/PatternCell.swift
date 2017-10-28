//
//  PatternCell.swift
//  SwiftDemo08
//
//  Created by Crack on 2017/10/29.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class PatternCell: UITableViewCell {

    @IBOutlet weak var patternNameLabel: UILabel!
    @IBOutlet weak var patternImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
