//
//  ViewController.swift
//  SwiftDemo12
//
//  Created by Crack on 2017/11/4.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    
    var tableView: UITableView!
    var collectionView: UICollectionView!
    
    var tableCellIndex = 0
    let tableDataSource:Array<Array<String>> = [["龙虾"], ["蟹类"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI() {
        
        // tableView
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW * 0.3, height: kScreenH), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
//        MyTableViewCell
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "TableCell")
//        tableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        tableView.selectRow(at: NSIndexPath.init(row: tableCellIndex, section: 0) as IndexPath, animated: true, scrollPosition: .none)
        
        // collectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: (kScreenW*0.7-3*10)/2, height: (kScreenW*0.7-3*10)/2)
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView.init(frame: CGRect.init(x: kScreenW * 0.3, y: 0, width: kScreenW * 0.7, height: kScreenH), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        
        let view = UIView.init(frame: CGRect.init(x: kScreenW*0.3, y: 0, width: 1, height: kScreenH))
        view.backgroundColor = UIColor.black
        self.view.addSubview(view)
        
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = MyTableViewCell.init(style: .default, reuseIdentifier: "TableCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! MyTableViewCell
        
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = tableDataSource[indexPath.row][0]
        
        cell.layoutSubviews()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected((cell?.isSelected)!, animated: true)
        
        self.tableCellIndex = indexPath.row
        collectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.purple.cgColor
        
        // bolong
        let imgView = UIImageView.init(frame: cell.contentView.frame)
        imgView.contentMode = .scaleAspectFit
        if self.tableCellIndex == 0 {
            imgView.image = UIImage.init(named: "bolong")
        } else {
            imgView.image = UIImage.init(named: "timg")
        }
        cell.contentView.addSubview(imgView)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    
    
}





