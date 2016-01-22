//
//  ViewController.swift
//  SQCoreMotation
//
//  Created by XinJinquan on 2016/1/22.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {

    @IBOutlet var yaw: UILabel!
    @IBOutlet var roll: UILabel!
    @IBOutlet var pitch: UILabel!
    @IBOutlet var z: UILabel!
    @IBOutlet var y: UILabel!
    @IBOutlet var x: UILabel!
    let motionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) {(motion, error) -> Void in
            if CMPedometer.isStepCountingAvailable() {
                print("available")
            } else {
                print("not")
            }
            if CMAltimeter.isRelativeAltitudeAvailable() {
                print("available")
            } else {
                print("not")
            }
            let xStr = String(format: "%0.2f", (motion?.gravity.x)!)
            self.x.text = xStr
            let yStr = String(format: "%0.2f", (motion?.gravity.y)!)
            self.y.text = yStr
            let zStr = String(format: "%0.2f", (motion?.gravity.z)!)
            self.z.text = zStr
            
            
            if let pValue = motion?.attitude.pitch {
                let pStr = String(format:"%.2f",   pValue * 180 / M_PI)
                self.pitch.text = pStr
            }
            if let pValue = motion?.attitude.roll {
                let pStr = String(format:"%.2f",   pValue * 180 / M_PI)
                self.roll.text = pStr
            }
            if let pValue = motion?.attitude.yaw {
                let pStr = String(format:"%.2f",   pValue * 180 / M_PI)
                self.yaw.text = pStr
            }
            
            
//            let pitch = NSString(format:"%.2f",(motion?.attitude.pitch)!)
//            self.pitch.text = pitch as String
//            let roll = NSString(format:"%.2f",(motion?.attitude.roll)!)
//            self.roll.text = roll as String
//            let yaw = NSString(format:"%.2f",(motion?.attitude.yaw)!)
//            self.yaw.text = yaw as String
            
     
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

