//
//  ViewController.swift
//  SwiftDemo01
//
//  Created by Crack on 2017/10/21.
//  Copyright © 2017年 Crack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var leftBottomLabel: UILabel!
    @IBOutlet weak var rightTopLabel: UILabel!
    @IBOutlet weak var rightBottomLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.maximumValue = 100.0
        self.slider.minimumValue = 1.0
        self.slider.value = 15.0
        
        self.leftTopLabel.text = "Tip(15%)"
        self.rightTopLabel.text = "\(((Float(self.textField.text!) ?? 0.0) * 15) / 100.0)"
        self.rightBottomLabel.text = "\(Float(self.rightTopLabel.text!) ?? 0.0 + 0.15)"
        
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        
        let value = Int(round(sender.value))
        let textFieldText = self.textField.text
        
        self.rightTopLabel.text = "\(((Float(self.textField.text!) ?? 0.0) * Float(value)) / 100.0)"
        
        self.rightBottomLabel.text = "\(((Float(self.rightTopLabel.text!) ?? 0.0) + (Float(textFieldText!) ?? 0.0)))"
        
        self.leftTopLabel.text = "Tip(\(value)%)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

