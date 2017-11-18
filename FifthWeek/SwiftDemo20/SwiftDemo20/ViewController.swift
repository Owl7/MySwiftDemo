//
//  ViewController.swift
//  SwiftDemo20
//
//  Created by Crack on 2017/11/18.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // 初始化播放器
    lazy var player: AVPlayer = {
        var player = AVPlayer()
        let playerItem = getPlayItem()
        player = AVPlayer.init(playerItem: playerItem)
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(test), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        return player
    }()
    
    
    
    @objc func test() {
        player.seek(to: kCMTimeZero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupForAVplayerView()
        player.play()
        
        
        let loginBtn = UIButton()
        loginBtn.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width/2, height: 50)
        loginBtn.backgroundColor = UIColor.init(red: 150/255, green: 150/255, blue: 150/255, alpha: 0.5)
        loginBtn.setTitle("LOG IN", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(loginBtn)
        
        let signupBtn = UIButton()
        signupBtn.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width/2, height: 50)
        signupBtn.backgroundColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.6)
        signupBtn.setTitle("SIGN UP", for: .normal)
        signupBtn.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(signupBtn)
    }
    
    func getPlayItem() -> AVPlayerItem {
        
        let filePath = Bundle.main.path(forResource: "Breathe", ofType: "mp4")
        let url = NSURL.init(fileURLWithPath: filePath!)
        
        return AVPlayerItem.init(url: url as URL)
        
    }
    
    func setupForAVplayerView() {
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = view.frame
        view.layer.addSublayer(playerLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

