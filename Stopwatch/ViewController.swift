//
//  ViewController.swift
//  Stopwatch
//
//  Created by Towa Aoyagi on 2021/01/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label:UILabel!
    @IBOutlet var result :UILabel!
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.isHidden = true
    }
    
    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true)
            result.isHidden = true
        }
        
        
    }
    @IBAction func finish(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
        
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    @IBAction func reset(){
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
        result.isHidden = true
    }
    
    @objc func hantei(){
        if !timer.isValid{
            if count <= 10.20 && count >= 9.80{
                result.text = "PERFECT"
            }else if count <= 10.30 && count >= 9.70{
                result.text = "GREAT"
                
            }else if count <= 10.50 && count >= 9.50{
                result.text = "GOOD"
            }else{
                result.text = "BAD"
            }
            result.textColor = UIColor.red
            result.isHidden = false
        }
    }


}

