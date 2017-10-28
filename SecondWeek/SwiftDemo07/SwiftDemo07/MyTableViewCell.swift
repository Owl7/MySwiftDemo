//
//  MyTableViewCell.swift
//  SwiftDemo07
//
//  Created by Crack on 2017/10/29.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var userinfo: UserInfo! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        headerBtn.setTitle(userinfo.name, for: .normal)
        nameLabel.text = userinfo.titleName
        dateLabel.text = userinfo.date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerBtn.layer.masksToBounds = true
        headerBtn.layer.cornerRadius = 25
        headerBtn.backgroundColor = UIColor.lightGray
    }

}
