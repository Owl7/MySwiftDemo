//
//  ViewController.swift
//  SwiftDemo02
//
//  Created by Crack on 2017/10/22.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource:Array<String>! = []
    var indexArr:Array<String>! = []
    var groupResult:Array<Array>! = Array<Array<String>>()
    var headerLabel = UILabel()
    var headerView = UIView()
    
    //    lazy var headerLabel: UILabel = {
    //        let tempHeaderLabel = UILabel()
    //
    //        return tempHeaderLabel
    //    }()
    //
    //    lazy var headerView: UIView = {
    //        let tempHeaderView = UIView()
    //
    //        return tempHeaderView
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.sectionFooterHeight = 0.001
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //        self.headerView.backgroundColor = UIColor.red
        //        self.headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.init().bounds.width, height: 30)
        //        self.tableView.tableHeaderView = self.headerView
        
        // 姓名
        //        self.dataSource = ["Jack", "Tom", "Bob", "Ave", "Crack", "Eason", "Abboy", "张三", "王五", "李四", "赵六"]
        self.dataSource = ["Jack", "Tom", "Bob", "Ave", "Crack", "Eason", "Abboy", "张三", "王五", "李四", "赵六", "￥hhh, .$"," ￥Chin ese ","开源中国 ","www.oschina.net",
                           "开源技术","社区","开发者","传播",
                           "2014","a1","100","中国","暑假作业",
                           "键盘", "鼠标","hello","world","b1"]
        
        self.indexArr = ChineseString.indexArray(self.dataSource) as! Array<String>!
        self.groupResult = ChineseString.letterSortArray(self.dataSource) as! Array<Array<String>>!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark  UITableViewDataSource, UITabBarDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.indexArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groupResult[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //        var sortArr = Array<String>()
        //        sortArr = ChineseString.sortArray(self.groupResult[indexPath.section]) as! Array!
        //        cell.textLabel?.text = sortArr[indexPath.row]
        cell.textLabel?.text = self.groupResult[indexPath.section][indexPath.row]
        
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return self.indexArr[section]
    //    }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        self.headerView.backgroundColor = UIColor.groupTableViewBackground
    //        self.headerView.backgroundColor = UIColor.red
    //        self.headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.init().bounds.width, height: 30)
    //        self.headerLabel.backgroundColor = UIColor.groupTableViewBackground
    //        self.headerLabel.text = self.indexArr[section]
    //        self.headerLabel.textColor = UIColor.white
    //        self.headerView.addSubview(self.headerLabel)
    //        return UILabel.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.width, height: 30))
    //    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        //        label.textColor = UIColor.white
        label.textColor = UIColor.black
        label.text = self.indexArr[section]
        label.frame = CGRect(x: 16, y: 0, width: tableView.bounds.width, height: 44)
        
        let view = UIView()
        view.backgroundColor = UIColor.groupTableViewBackground
        //        view.backgroundColor = UIColor.white
        view.frame = CGRect(x: 16, y: 0, width: tableView.bounds.width, height: 44)
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}

