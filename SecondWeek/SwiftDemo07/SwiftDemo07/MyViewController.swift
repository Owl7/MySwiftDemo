//
//  MyViewController.swift
//  SwiftDemo07
//
//  Created by Crack on 2017/10/29.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

protocol MyDelegate {
    func didDelegateText(userInfo: UserInfo)
}

class MyViewController: UIViewController {

    var mydelegate: MyDelegate!
    
    @IBOutlet weak var nameBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var shopBtn: UIButton!
    @IBOutlet weak var plainBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var text = "名字"
    
    @IBAction func nameClick(_ sender: UIButton) {
        text = (nameBtn.titleLabel?.text)!
        sender.backgroundColor = UIColor.green
        phoneBtn.backgroundColor = UIColor.lightGray
        shopBtn.backgroundColor = UIColor.lightGray
        plainBtn.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func phoneClick(_ sender: UIButton) {
        text = (phoneBtn.titleLabel?.text)!
        sender.backgroundColor = UIColor.green
        nameBtn.backgroundColor = UIColor.lightGray
        shopBtn.backgroundColor = UIColor.lightGray
        plainBtn.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func shopClick(_ sender: UIButton) {
        text = (shopBtn.titleLabel?.text)!
        sender.backgroundColor = UIColor.green
        nameBtn.backgroundColor = UIColor.lightGray
        phoneBtn.backgroundColor = UIColor.lightGray
        plainBtn.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func plainClick(_ sender: UIButton) {
        text = (plainBtn.titleLabel?.text)!
        sender.backgroundColor = UIColor.green
        nameBtn.backgroundColor = UIColor.lightGray
        shopBtn.backgroundColor = UIColor.lightGray
        phoneBtn.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func doneClick(_ sender: UIButton) {
        
        tempbuttonAction()
        navigationController?.popViewController(animated: true)
    }
    
    
    func tempbuttonAction() {
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        //        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        dformatter.dateFormat = "yyyy-MM-dd"
        // 使用日期格式器格式化日期、时间
        let datestr = dformatter.string(from: datePicker.date)
        
        let userInfo: UserInfo = UserInfo.init(name: text, titleName: textField.text!, date: datestr)
        mydelegate?.didDelegateText(userInfo: userInfo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit Todo"
        
        nameBtn.layer.masksToBounds = true
        nameBtn.layer.cornerRadius = 30
        phoneBtn.layer.masksToBounds = true
        phoneBtn.layer.cornerRadius = 30
        shopBtn.layer.masksToBounds = true
        shopBtn.layer.cornerRadius = 30
        plainBtn.layer.masksToBounds = true
        plainBtn.layer.cornerRadius = 30
        
        datePicker.locale = Locale(identifier: "zh_CN")
        
        datePicker.datePickerMode = UIDatePickerMode.date
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}












