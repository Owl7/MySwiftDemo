//
//  CustomTableViewCell.swift
//  SwiftDemo04
//
//  Created by Crack on 2017/10/22.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

protocol CellRefreshDelegate: class {
    func CellWillRefresh() -> Void
}

class CustomTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    weak var refreshDelegate: CellRefreshDelegate?
    var countrys: Array<Country> = []
    var datasource : Array<String> = []
    
    lazy var tableView:UITableView = {
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
        super.init(style: .default, reuseIdentifier: CustomTableViewCell.cellId())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func cellId() -> String {
        return "CustomCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(continent: CountryModel) {
        
        self.countrys = continent.country
        
        var cellHeight: Float = Float(continent.country.count) * continent.height
        
        for country in self.countrys {
            if country.isShow {
                cellHeight += country.height * Float(country.city.count)
            }
        }
        
        tableView.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: UIScreen.main.bounds.size.width, height: CGFloat(cellHeight)))
        tableView.reloadData()
        
    }
    
    // MARK: UITableView Delegate DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.countrys.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let country: Country = self.countrys[section]
        
        let label:UILabel = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 30, y: 0), size: CGSize.init(width: UIScreen.main.bounds.size.width-130, height: 50)))
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black;
        
        let view : UIView = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: UIScreen.main.bounds.size.width, height: 50)))
        view.backgroundColor = UIColor.init(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        
        view.addSubview(label)
        label.text = country.name;
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        view.tag = 1024 + section;
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let country: Country = countrys[section]
        if country.isShow {
            return country.city.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country: Country = countrys[indexPath.section]
        let city: City = country.city[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let label = UILabel()
        label.text = city.name
        label.frame = CGRect.init(x: 40, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height)
        label.font = UIFont.systemFont(ofSize: 14)
        cell.contentView.addSubview(label)
        
        cell.backgroundView?.backgroundColor = UIColor.init(red: 251/255.0, green: 251/255.0, blue: 251/255.0, alpha: 1.0)
        cell.backgroundColor = UIColor.init(red: 251/255.0, green: 251/255.0, blue: 251/255.0, alpha: 1.0)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.separatorInset = UIEdgeInsetsMake(0, 40, 0, 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: ---
    
    @objc func tapBlurButton(_ sender: UITapGestureRecognizer) {
        let view = sender.view
        let section = (view?.tag)! - 1024
        
        let country: Country = self.countrys[section]
        country.isShow = !country.isShow
        
        self.refreshDelegate?.CellWillRefresh()
    }

}










