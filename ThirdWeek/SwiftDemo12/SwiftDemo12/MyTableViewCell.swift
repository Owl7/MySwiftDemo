//
//  MyTableViewCell.swift
//  SwiftDemo12
//
//  Created by Crack on 2017/11/4.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

//    @IBOutlet weak var view: UIView!
//
//    @IBOutlet weak var labe: UILabel!
    
    var view: UIView = UIView()
    var labe: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        labe = UILabel.init(frame: CGRect.init(x: 20, y: self.bounds.height/2, width: self.bounds.width, height: 20))
//        self.addSubview(labe)
        
        view = UIView.init(frame: CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: 2, height: 60))
        view.backgroundColor = UIColor.red
        self.contentView.addSubview(view)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

//        view.isHidden = !selected
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        view.isHidden = !self.isSelected
        
//        if self.isSelected {
//            self.addSubview(view)
//        } else {
//            view.removeFromSuperview()
//        }
        
        
    }

}
