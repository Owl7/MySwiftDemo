//
//  ViewController.swift
//  SwiftDemo19
//
//  Created by Crack on 2017/11/18.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self,selector:#selector(tickDown1),userInfo:nil,repeats:false)
        Timer.scheduledTimer(timeInterval: 0.4, target:self,selector:#selector(tickDown2),userInfo:nil,repeats:false)
        Timer.scheduledTimer(timeInterval: 0.6, target:self,selector:#selector(tickDown3),userInfo:nil,repeats:false)
        Timer.scheduledTimer(timeInterval: 0.8, target:self,selector:#selector(tickDown4),userInfo:nil,repeats:false)
        Timer.scheduledTimer(timeInterval: 1.0, target:self,selector:#selector(tickDown5),userInfo:nil,repeats:false)
        Timer.scheduledTimer(timeInterval: 1.2, target:self,selector:#selector(tickDown6),userInfo:nil,repeats:false)

    }
    
    @objc func tickDown1() {
        anim(view: view1)
    }
    @objc func tickDown2() {
        anim(view: view2)
    }
    @objc func tickDown3() {
        anim(view: view3)
    }
    @objc func tickDown4() {
        anim(view: view4)
    }
    @objc func tickDown5() {
        anim(view: view5)
    }
    @objc func tickDown6() {
        anim(view: view6)
    }
    
    func anim(view: UIView) {
        
        var iFrame = view.frame
        iFrame.size.height = 0
        iFrame.origin.y = view.frame.origin.y + view.bounds.height/2
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            view.frame = iFrame
        }) { (Bool) in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                view.frame = CGRect(x: view.frame.origin.x, y: 172, width: 12, height: 128)
            }, completion: { (Bool) in
                self.anim(view: view)
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






