//
//  ViewController.swift
//  SwiftDemo04
//
//  Created by Crack on 2017/10/22.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var json: JSON = JSON.null
    var provinceArr = Array<String>()
    var citiesArr = Array<Array<String>>()
    var districtArr = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(DisttictTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.clear
        
        let path = Bundle.main.path(forResource: "json", ofType: "json")
        let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path ?? ""))
        json = try! JSON(data: data!)
        
        for (key, value) in json {
            provinceArr.append(key)
            var citys = Array<String>()
            for (city, _) in value {
                citys.append(city)
            }
            citiesArr.append(citys)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark UITableViewDelegate, UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return provinceArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return citiesArr[section].count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DisttictTableViewCell
        let cell = DisttictTableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.citys = citiesArr
//        cell.data0 = provinceArr
        cell.json = json
//        cell.textLabel?.text = citiesArr[indexPath.section][indexPath.row]
//        cell.textLabel?.text =
        cell.backgroundView?.backgroundColor = UIColor.init(red: 241/255.0, green: 241/255.0, blue: 241/255.0, alpha: 1.0)
        cell.backgroundColor = UIColor.init(red: 241/255.0, green: 241/255.0, blue: 241/255.0, alpha: 1.0)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
//        zhankai(indexPath: indexPath)
        
    }
    
//    func zhankai(indexPath: IndexPath) {
//
//        let district = (json[provinceArr[indexPath.section]])[citiesArr[indexPath.section][indexPath.row]]
//
//        districtTableView.frame = CGRect.init(x: 20, y: 20, width: Int(tableView.bounds.size.width), height: (district.count * 44))
//        districtTableView.backgroundColor = UIColor.clear
//
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.frame = CGRect.init(x: 0, y: 0, width: Int(tableView.bounds.size.width), height: district.count * 44 + 44)
//        cell?.addSubview(districtTableView)
//
//        print(district)
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = provinceArr[section]
        label.frame = CGRect(x: 10, y: 0, width: tableView.bounds.width, height: 44)
        
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 228/255.0, green: 228/255.0, blue: 228/255.0, alpha: 1.0)
        view.frame = CGRect(x: 10, y: 0, width: tableView.bounds.width, height: 44)
        view.addSubview(label)
        view.tag = section
        
        let gr = UITapGestureRecognizer()
        gr.numberOfTapsRequired = 1
        gr.addTarget(self, action: #selector(unfold))
        
        view.addGestureRecognizer(gr)
        
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        
        return view
    }
    
    @objc func unfold(gr: UITapGestureRecognizer) {
        print(gr.view?.tag)
        let cell = DisttictTableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.section = (gr.view?.tag)!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }


}

