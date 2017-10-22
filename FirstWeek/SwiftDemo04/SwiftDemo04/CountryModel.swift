//
//  CountryModel.swift
//  SwiftDemo04
//
//  Created by Crack on 2017/10/22.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class City: NSObject {
    var name: String!
}

class Country: NSObject {
    var name: String!
    var city: Array<City>! = []
    var isShow: Bool! = false
    var height: Float! = 0
}

class CountryModel: NSObject {
    var name: String!
    var country: Array<Country>! = []
    var isShow: Bool! = false
    var height: Float! = 0
}
