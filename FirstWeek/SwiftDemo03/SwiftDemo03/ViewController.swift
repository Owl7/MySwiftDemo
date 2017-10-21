//
//  ViewController.swift
//  SwiftDemo03
//
//  Created by Crack on 2017/10/22.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    var number = 0.0
    var isReset = false
    
    var timer: Timer!
    
    //    private var timer: DispatchSourceTimer?
    //    var pageStepTime: DispatchTimeInterval = .seconds(5)
    
    // deadline 结束时间
    // interval 时间间隔
    // leeway   时间精度
    
    //    func setTheTimer() {
    //        timer = DispatchSource.makeTimerSource(queue: .main)
    //        timer?.schedule(deadline: .now() + pageStepTime, repeating: pageStepTime)
    //        timer?.setEventHandler {
    //
    //        }
    //        // 启动定时器
    //        timer?.resume()
    //    }
    //
    //    func deinitTimer() {
    //        if self.timer != nil {
    //            timer?.cancel()
    //            timer = nil
    //        }
    //    }
    
    @IBAction func startBtnClick(_ sender: UIButton) {
        self.setTimer()
        timer.fireDate = NSDate.init() as Date
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
    }
    
    @IBAction func pauseBtnClick(_ sender: UIButton) {
        timer.fireDate = Date.distantFuture
        pauseBtn.isEnabled = false
        startBtn.isEnabled = true
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        timer.invalidate()
        timer = nil
        isReset = true
        number = 0.0
        self.label.text = "0.0"
        pauseBtn.isEnabled = false
        startBtn.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTimer()
        startBtn.isEnabled = false
        
    }
    
    func setTimer() {
        if timer == nil {
            if #available(iOS 10.0, *) {
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                    self.count()
                })
            } else {
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(count), userInfo: nil, repeats: true)
            }
        } else {
            
        }
    }
    
    @objc func count() {
        
        number += 0.1
        self.label.text = "\(number)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

