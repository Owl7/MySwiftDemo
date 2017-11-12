//
//  ViewController.swift
//  SwiftDemo15
//
//  Created by Crack on 2017/11/12.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit
import ChainableAnimations

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(label)
        label.isHidden = true
        self.view.addSubview(myview1)
        self.view.addSubview(myview2)
        self.view.addSubview(myview3)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myview1.backgroundColor = UIColor.orange
        let animator1 = ChainableAnimator(view: myview1)
        animator1.move(x: 40,y: 30).thenAfter(t: 0.6).make(x: 16).spring.animate(t: 0.5) {
            
        }
        myview2.backgroundColor = UIColor.green
        let animator2 = ChainableAnimator(view: myview2)
        animator2.move(x: -40,y: 30).thenAfter(t: 0.6).make(x: Float(UIScreen.main.bounds.size.width-20-100)).spring.animate(t: 0.5) {
        }
        
        let animator3 = ChainableAnimator(view: myview3)
        animator3.make(y: 320+30+100).make(height: 200).thenAfter(t: 0.6).move(y: -10).spring.animate(t: 0.6) {
            self.label.isHidden = false
        }

//        Float(UIScreen.main.bounds.size.width/2-100)
//        UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: .calculationModePaced, animations: {
//            self.myview3.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: 320+30, width: 200, height: 200)
//        }) { (finsh: Bool) in
//            self.label.isHidden = false
//        }
//        let animator3 = ChainableAnimator(view: self.myview3)
//        animator3.spring.animate(t: 0.4)
//        UIView.animate(withDuration: 0.6, animations: {
//            self.myview3.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: 320+30, width: 200, height: 200)
//
//        }) { (finsh: Bool) in
//            self.label.isHidden = false
//
//
//        }

    }
    
    lazy var label: UIView = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 74, width: UIScreen.main.bounds.size.width, height: 20)
        label.textAlignment = .center
        label.text = "吓死宝宝了！"
        return label
    }()
    
    lazy var myview1: UIView = {
        let myview1 = UIView()
        myview1.backgroundColor = UIColor.green
        myview1.frame = CGRect(x: 20, y: 200, width: 100, height: 100)
        return myview1
    }()
    lazy var myview2: UIView = {
        let myview2 = UIView()
        myview2.backgroundColor = UIColor.orange
        myview2.frame = CGRect(x: UIScreen.main.bounds.size.width-20-100, y: 200, width: 100, height: 100)
        return myview2
    }()
    lazy var myview3: UIView = {
        let myview3 = UIView()
        myview3.backgroundColor = UIColor.lightGray
        myview3.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: 320, width: 200, height: 30)
        return myview3
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

