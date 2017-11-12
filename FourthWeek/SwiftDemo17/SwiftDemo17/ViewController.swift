//
//  ViewController.swift
//  SwiftDemo17
//
//  Created by Crack on 2017/11/12.
//  Copyright © 2017年 Crack. All rights reserved.
//


// 借鉴代码
//http://www.jianshu.com/p/1bf7fc25f17e
//http://www.codeceo.com/article/twitter-ios-app-startup-animation.html?utm_medium=hao.caibaojian.com&utm_source=hao.caibaojian.com

import UIKit

class ViewController: UIViewController {

    let dialLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dialLayer.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
        dialLayer.position = self.view.center
        dialLayer.contents = UIImage.init(named: "twitter logo mask")?.cgImage
        
        view.layer.mask = dialLayer
        
        let window = UIApplication.shared.windows.last
        window?.backgroundColor = UIColor.init(red: 27/255.0, green: 139/255.0, blue: 243/255.0, alpha: 1.0)
        
        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime() + 1
        logoAnimation.duration = 2
        logoAnimation.keyTimes = [0, 0.4, 1]
        logoAnimation.values = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 85, height: 85)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))]
        logoAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
                                         CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)]
        logoAnimation.isRemovedOnCompletion = false
        logoAnimation.fillMode = kCAFillModeForwards
        dialLayer.add(logoAnimation, forKey: "zoomAnimation")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func maskAni() -> CAKeyframeAnimation{
    
        let maskAni: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "bounds")
        maskAni.duration = 30.75
        maskAni.beginTime = CACurrentMediaTime() + 0.5
        
        let startRect = dialLayer.frame
        let tempRetct = CGRect(x: 0, y: 0, width: 100, height: 100)
        let finalRect = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        maskAni.values = [startRect, tempRetct, finalRect]
        
        maskAni.timingFunctions = [CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)]
        
        maskAni.isRemovedOnCompletion = false
        
        maskAni.fillMode = kCAFillModeForwards

        return maskAni
    
    }
    

}

