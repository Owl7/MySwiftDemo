//
//  ContactsTableViewCell.swift
//  SwiftDemo05
//
//  Created by Crack on 2017/10/25.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        headerImageView.layer.masksToBounds = true
        headerImageView.layer.cornerRadius = 25
    }
    
}
