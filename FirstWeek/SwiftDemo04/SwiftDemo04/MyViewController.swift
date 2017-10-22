//
//  MyViewController.swift
//  SwiftDemo04
//
//  Created by Crack on 2017/10/22.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellRefreshDelegate {

    @IBOutlet weak var tableView: UITableView!
    var json: JSON = JSON.null
    var source: Array<CountryModel> = []
    var sectionSource: Array<String> = []
    var cellHeight: Float?
    var showSections: [Int] = []
    var showCells: [IndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView.init()
        tableView.backgroundColor = UIColor.clear
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -- UITableView Delegate DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.source.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let continent:CountryModel = self.source[section]
        
        let label:UILabel = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 10, y: 0), size: CGSize.init(width: UIScreen.main.bounds.size.width-110, height: 60)))
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black;
        
        let view : UIView = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: UIScreen.main.bounds.size.width, height: 60)))
        view.backgroundColor = UIColor.init(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        
        view.addSubview(label)
        label.text = continent.name;
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        view.tag = 1024 + section;
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        
        return view
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showSections.contains(section) {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let continent: CountryModel = source[indexPath.section]
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell.refreshDelegate = self
        cell.configCell(continent: continent)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let continent: CountryModel = source[indexPath.section]
        var cellHeight: Float = continent.height * Float(continent.country.count)
        for country in continent.country {
            if country.isShow {
                cellHeight += country.height * Float(country.city.count)
            }
        }
        return CGFloat(cellHeight)
    }
    
    // MARK: -- MyFunc
    func CellWillRefresh() {
        tableView.reloadData()
    }
    
    @objc func tapBlurButton(_ sender: UITapGestureRecognizer) {
        let view = sender.view
        let section = (view?.tag)! - 1024
        
        if showSections.contains(section) {
            showSections.remove(at: showSections.index(of: section)!)
        } else {
            showSections.append(section)
        }
        tableView.reloadData()
    }
    
    
    func initData() {
        
//        let path = Bundle.main.path(forResource: "Country", ofType: "json")
//        let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path ?? ""))
//        json = try! JSON(data: data!)
//        let dataDic = json.dictionaryValue as Dictionary<String, Any>
        
        let dataDic:Dictionary<String, Dictionary<String, Array<String>>> = [
            "亚洲" : [
                "中国" : ["北京", "上海", "广州"],
                "日本" : ["东京", "大阪"]
            ],
            "欧洲" :[
                "英国" : ["伦敦", "伯明翰"],
                "法国" : ["巴黎", "马赛"],
            ]
        ]
        
        for key in dataDic.keys {
            let continent:CountryModel = CountryModel()
            continent.name = key
            continent.height = 50
            let subDataDic:Dictionary<String, Array<String>> = dataDic[key]!
            for subkey in subDataDic.keys {
                let country:Country = Country()
                country.name = subkey
                country.height = 50

                let citys:Array<String> = subDataDic[subkey]!
                for name in citys {
                    let city:City = City()
                    city.name = name
                    country.city.append(city)
                }
                continent.country.append(country)
            }
            self.source.append(continent)
        }
        
    }

}













