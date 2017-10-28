//
//  ViewController.swift
//  SwiftDemo05
//
//  Created by Crack on 2017/10/24.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "Cell"
    
    @IBOutlet weak var tableView: UITableView!
    var json: JSON = JSON.null
    var dataSource = Array<ContactsModel>()
    var nameData = Array<String>()
    var nameSortData: Array<Array>! = Array<Array<String>>()
    var indexArr = Array<String>()
    
    var newData: Array<Array>! = Array<Array<ContactsModel>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        for str in dataSource {nameData.append(str.name)}
        
//        dataSource.sort { (c1, c2) -> Bool in
//            c1.name < c2.name
//        }
        
        indexArr = ChineseString.indexArray(nameData) as! [String]
        nameSortData = ChineseString.letterSortArray(nameData) as! Array<Array<String>>!
        
        
//        for arr in nameSortData {
//            var a = [ContactsModel]()
//            for str in arr {
//                print(str)
//            }
//
//            for i in 0..<arr.count {
//                a.append(dataSource[i])
//            }
//            newData.append(a)
//        }
        
        
        
        tableView.register(UINib.init(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDelegate, DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return indexArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameSortData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ContactsTableViewCell
        cell.nameLabel.text = nameSortData[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailID") as! DetailViewController
        
//        detailVC.contactModel = dataSource[3]
//        detailVC.nameLabel.text = "nameSortData[indexPath.section][indexPath.row]"
        
        let cell = tableView.cellForRow(at: indexPath) as! ContactsTableViewCell
        
        var model = ContactsModel()
        
        for m in dataSource {
            if m.name == cell.nameLabel.text {
                model = m
                break;
            }
        }
        
        detailVC.contactModel = model
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return indexArr[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    // MARK: -- My Func
    func getData() {
        
        let path = Bundle.main.path(forResource: "json", ofType: "json")
        let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path ?? ""))
        json = try! JSON(data: data!)
        
        for dic in json["contacts"] {
            let model = ContactsModel()
            model.name = dic.1["name"].stringValue
            model.number = dic.1["phone"].stringValue
            model.headerImage = dic.1["headerImg"].stringValue
            model.email = dic.1["email"].stringValue
            model.notes = dic.1["nodes"].stringValue
            dataSource.append(model)
        }
        
    }
    
}














