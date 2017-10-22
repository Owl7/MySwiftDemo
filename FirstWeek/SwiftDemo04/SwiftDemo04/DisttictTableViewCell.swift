//
//  DisttictTableViewCell.swift
//  SwiftDemo04
//
//  Created by Crack on 2017/10/22.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit
import SwiftyJSON

class DisttictTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    var json: JSON = JSON.null
    
//    var data0 = Array<String>()
    var citys = Array<Array<String>>()
    var section = 0
    
    lazy var tableView: UITableView = {
        ()->UITableView in
        let tableView:UITableView = UITableView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.contentView.addSubview(tableView)
        return tableView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: DisttictTableViewCell.cellId())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func cellId() -> String {
        return "DisCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: UITableivew Delegate DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return citys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = data1[0][0]
        return cell
    }

}





