//
//  ViewController.swift
//  SwiftDemo18
//
//  Created by Crack on 2017/11/18.
//  Copyright © 2017年 Crack. All rights reserved.
//

// 代码连接
//http://www.jianshu.com/p/69f0b7f38cb6

import UIKit

class ViewController: UIViewController {

    var time: Timer!
    var progressValue: CGFloat = 0
    
    fileprivate func hollowLayer(){
        //创建空心的layer
        let hollowLayer = CAShapeLayer()
        hollowLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.layer.addSublayer(hollowLayer)
        hollowLayer.position = view.center
        
        //最外面待圆角的方形path
        let squarePath = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 5)
        //中间镂空的圆形path
        let hollowPath = UIBezierPath.init(ovalIn: CGRect(x: 10, y: 10, width: 80, height: 80))
        
        squarePath.append(hollowPath)
        hollowLayer.path = squarePath.cgPath
        
        hollowLayer.fillColor = UIColor.lightGray.cgColor
        //设置路径的填充模式为两个图形的非交集
        hollowLayer.fillRule = kCAFillRuleEvenOdd
        
        
        
        //创建进度layer
        let processSectorLayer = CAShapeLayer()
        view.layer.addSublayer(processSectorLayer)
        processSectorLayer.bounds = CGRect(x: 0, y: 0, width: 70, height: 70)
        processSectorLayer.position = view.center
        
        //进度的path
        let processSectorPath = UIBezierPath.init(arcCenter: CGPoint.init(x: 35, y: 35), radius: 17.5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        
        processSectorLayer.path = processSectorPath.cgPath
        
        processSectorLayer.lineWidth = 35
        
        //进度的起点和结束位置，设置进度条修改这个值和结束数值就可以了
        processSectorLayer.strokeStart = 0.5
        processSectorLayer.strokeEnd = 0.75
        
        processSectorLayer.strokeColor = UIColor.lightGray.cgColor
        
        processSectorLayer.fillColor = UIColor.clear.cgColor
    }
    
    // 进度条
    lazy var circleProgressLayer: CAShapeLayer = {
        let circleProgressLayer = CAShapeLayer()
        
        let circleBounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        circleProgressLayer.bounds = circleBounds
        circleProgressLayer.position = CGPoint(x: circleBounds.width / 2, y: circleBounds.height / 2)
        
        let circleProgressPath = UIBezierPath.init(arcCenter: CGPoint(x: circleBounds.width / 2, y: circleBounds.height / 2), radius: circleBounds.height / 2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        circleProgressLayer.strokeStart = 0
        circleProgressLayer.strokeEnd = 0
        circleProgressLayer.path = circleProgressPath.cgPath
        circleProgressLayer.lineWidth = 10
        circleProgressLayer.strokeColor = UIColor.init(red: 0, green: 151, blue: 255, alpha: 1).cgColor
        
        circleProgressLayer.fillColor = UIColor.clear.cgColor
        
        circleProgressLayer.position = view.center
        return circleProgressLayer
    }()
    
    // 灰色进度条
    lazy var lightGrayProgressLayer: CAShapeLayer = {
        let lightGrayProgressLayer = CAShapeLayer()
        
        let circleBounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        lightGrayProgressLayer.bounds = circleBounds
        lightGrayProgressLayer.position = CGPoint(x: circleBounds.width / 2, y: circleBounds.height / 2)
        
        let lightGrayProgressPath = UIBezierPath.init(arcCenter: CGPoint(x: circleBounds.width / 2, y: circleBounds.height / 2), radius: circleBounds.height / 2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        lightGrayProgressLayer.strokeStart = 0
        lightGrayProgressLayer.strokeEnd = 1
        lightGrayProgressLayer.path = lightGrayProgressPath.cgPath
        lightGrayProgressLayer.lineWidth = 10
        lightGrayProgressLayer.strokeColor = UIColor.lightGray.cgColor
        
        lightGrayProgressLayer.fillColor = UIColor.clear.cgColor
        
        lightGrayProgressLayer.position = view.center
        return lightGrayProgressLayer
    }()
    
    // 进度label
    lazy var progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.center = view.center
        progressLabel.bounds.size = CGSize(width: 150, height: 30)
        progressLabel.text = "0.0%"
        progressLabel.textColor = UIColor.init(red: 0, green: 151, blue: 255, alpha: 1)
        progressLabel.font = UIFont.systemFont(ofSize: 32)
        progressLabel.textAlignment = .center
        return progressLabel
    }()
    
    // 文本提示信息
    lazy var textLabel: UILabel = {
        let textLabel = UILabel.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 2 + 155, width: UIScreen.main.bounds.width, height: 30))
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 14)
        textLabel.text = "请输入已经使用的流量百分比:(范围0 ~ 100)"
        return textLabel
    }()
    
    // 输入框
    lazy var textField: UITextField = {
        let textField = UITextField.init(frame: CGRect(x: 50, y: UIScreen.main.bounds.height / 2 + 200, width: 90, height: 30))
        textField.placeholder = "范围0~100"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    // 开始动画按钮
    lazy var startAnimateBtn: UIButton = {
        let startAnimateBtn = UIButton.init(frame: CGRect(x: 220, y: UIScreen.main.bounds.height / 2 + 200, width: 90, height: 30))
        startAnimateBtn.setTitle("Animation", for: .normal)
        startAnimateBtn.setTitleColor(UIColor.init(red: 0, green: 151, blue: 255, alpha: 1), for: .normal)
        startAnimateBtn.addTarget(self, action: #selector(startAnimate), for: .touchUpInside)
        return startAnimateBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        hollowLayer()
        
        view.layer.addSublayer(lightGrayProgressLayer)
        view.layer.addSublayer(circleProgressLayer)
        view.addSubview(progressLabel)
        view.addSubview(textLabel)
        view.addSubview(textField)
        view.addSubview(startAnimateBtn)
        
    }
    
    @objc private func startAnimate() {
        
        if textField.text == "" {
            
            print("文本框为空，请重新输入")
            
            return
        } else {
            if (Float(textField.text!) == nil) {
                
                print("请输入数字")
                
                return
            } else {
                if (textField.text! as NSString).floatValue > 100 || (textField.text! as NSString).floatValue < 0 {
                    
                    print("你输入的数字不在范围内")
                    
                    return
                }
            }
        }
        
        // 开启定时器
        time = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(progressShowNumber), userInfo: nil, repeats: true)
    }
    
    @objc private func progressShowNumber() {
        // 30
        
        if (progressValue / 100 > 1) || (progressValue / 100) > CGFloat(Float(textField.text!)! / 100) {
            time.invalidate()
            return
        }
        
        circleProgressLayer.strokeEnd = progressValue / 100
        progressLabel.text = "\(progressValue)%"
        
        
        progressValue += 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

