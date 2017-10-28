//
//  DetailViewController.swift
//  SwiftDemo05
//
//  Created by Crack on 2017/10/24.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var contactModel: ContactsModel = ContactsModel()
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nodesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - My Func
    func setupUI() {
        
        headerImageView.layer.masksToBounds = true
        headerImageView.layer.cornerRadius = 40
        
        nameLabel.text = contactModel.name
        emailLabel.text = contactModel.email
        phoneLabel.text = contactModel.number
        nodesLabel.text = contactModel.notes
        
    }

}
