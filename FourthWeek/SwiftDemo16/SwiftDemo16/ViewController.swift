//
//  ViewController.swift
//  SwiftDemo16
//
//  Created by Crack on 2017/11/12.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer!
    let dialLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dialLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        dialLayer.position = self.view.center
        dialLayer.contents = UIImage.init(named: "h")?.cgImage
        
        view.layer.addSublayer(dialLayer)
        
        let im = UIImageView()
        im.frame = CGRect(x: UIScreen.main.bounds.size.width/2-200/2, y: 64, width: 200, height: 200)
        im.image = UIImage.init(named: "h")
        self.view.addSubview(im)
        
        
        UIView.animate(withDuration: 2.0, animations: {
            im.alpha = 0
        }) { (Bool) ->() in
            //1.创建动画对象
            let anim = CABasicAnimation()
            
            //2.设置动画属性
            anim.keyPath = "transform.scale"
            anim.toValue = 0.4
            
            //设置动画执行的次数
            anim.repeatCount = MAXFLOAT
            //设置动画的执行时间
            anim.duration = 0.8
            
            //自动反转(怎么去怎么回)
            anim.autoreverses = true
            //添加动画
            self.dialLayer.add(anim, forKey: nil)
        }
        
    }
    
//    func animate1() {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.dialLayer.setAffineTransform(.init(scaleX: 2, y: 2))
//        }) { (finsh: Bool) in
//            self.animate1()
//        }
//    }
//
//    func animate2() {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.dialLayer.setAffineTransform(.init(scaleX: 1, y: 1))
//        }) { (finsh: Bool) in
//            self.animate1()
//        }
//    }
//
//    func setTimer() {
//        if timer == nil {
//            if #available(iOS 10.0, *) {
//                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
//                    self.count()
//                })
//            } else {
//                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(count), userInfo: nil, repeats: true)
//            }
//        } else {
//
//        }
//    }

//    @objc func count() {
//        dialLayer.setAffineTransform(.init(scaleX: 0.5, y: 0.5))
//        dialLayer.setAffineTransform(.init(scaleX: 2, y: 2))
        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

