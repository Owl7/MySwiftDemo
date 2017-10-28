//
//  ViewController.swift
//  SwiftDemo07
//
//  Created by Crack on 2017/10/27.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: NSMutableArray = UserInfo.createUserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Todo List"
        tableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(myEdit))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(gotoEdit))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
//    fileprivate struct Storyboard {
//        static let CellIdentifier = "Cell"
//    }
    
    @objc func myEdit(item: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @objc func gotoEdit(item: UIBarButtonItem) {
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let myviewVC = stroyboard.instantiateViewController(withIdentifier: "MyViewID") as! MyViewController
        myviewVC.mydelegate = self
        navigationController?.pushViewController(myviewVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyTableViewCell
        cell.userinfo = dataSource[indexPath.row] as! UserInfo
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    // 移动 cell 时触发
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 移动cell之后更换数据数组里的循序
        dataSource.exchangeObject(at: (sourceIndexPath as NSIndexPath).row, withObjectAt: (destinationIndexPath as NSIndexPath).row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ViewController: MyDelegate {
    func didDelegateText(userInfo: UserInfo) {
        self.dataSource.add(userInfo)
        self.tableView.reloadData()
    }
    
}









