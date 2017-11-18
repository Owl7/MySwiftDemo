//
//  ViewController.swift
//  SwiftDemo21
//
//  Created by Crack on 2017/11/18.
//  Copyright © 2017年 Crack. All rights reserved.
//

// 代码地址
//https://github.com/imwcl/WCLLoadingView
//http://m.jb51.net/article/92314.htm

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loadingView: LoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.startAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


