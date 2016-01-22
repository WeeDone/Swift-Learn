//
//  ViewController.swift
//  SQSprite
//
//  Created by XinJinquan on 2016/1/8.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = self.view as! SKView
        let lblScence = TextScene(size:skView.frame.size)
        skView.presentScene(lblScence)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

