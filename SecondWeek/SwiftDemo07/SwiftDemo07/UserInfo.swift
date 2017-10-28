//
//  UserInfo.swift
//  SwiftDemo07
//
//  Created by Crack on 2017/10/29.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class UserInfo: NSObject {

    var name = ""
    var titleName = ""
    var date = ""
    
    init(name: String, titleName: String, date: String) {
        self.name = name
        self.titleName = titleName
        self.date = date
    }
    
    static func createUserInfo() -> NSMutableArray {
        return [UserInfo(name: "名字", titleName: "Hello", date: "2011-05-07"),
                UserInfo(name: "飞机", titleName: "HHEHE", date: "2017-09-07"),
                UserInfo(name: "购物", titleName: "HWWWWW", date: "2010-05-05"),
                UserInfo(name: "名字", titleName: "Crakc", date: "2015-05-08")
        ]
    }
    
}
