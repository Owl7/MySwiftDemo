//
//  ViewController.swift
//  SwiftDemo08
//
//  Created by Crack on 2017/10/29.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var data = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatternCell", for: indexPath) as! PatternCell
        let pattern = data[indexPath.row]
        cell.patternImageView.image = UIImage.init(named: pattern.image)
        cell.patternNameLabel.text = pattern.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: .normal, title: "🗑\nDelete") { (action, index) in
            print("Delete button tapped")
        }
        delete.backgroundColor = UIColor.gray
        let share = UITableViewRowAction.init(style: .normal, title: "🤗\nShare") { (action, index) in
            let firstActivityItem = self.data[indexPath.row]
            let activityViewController = UIActivityViewController.init(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
        
        share.backgroundColor = UIColor.red
        
        let download = UITableViewRowAction.init(style: .normal, title: "⬇️\nDownload") { (action, index) in
            print("Download button tapped")
        }
        download.backgroundColor = UIColor.blue
        return [download, share, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
}

















