//
//  SQDaeNode.swift
//  SQScen
//
//  Created by XinJinquan on 2016/1/11.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SceneKit

class SQDaeNode: NSObject {
    static func daeDataFromResoure(name:String, type:String) ->SCNSceneSource {
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: type)
        let daeScoure = SCNSceneSource(URL: url!, options: nil)
        return daeScoure!
    }
    
    static func nodeInDae() -> SCNNode? {
        let dae = SQDaeNode.daeDataFromResoure("Critter", type: "dae")
        let node = dae.entryWithIdentifier("Critter", withClass: SCNNode.self)
        if node != nil {
            node?.position = SCNVector3(5, 0, 0)
            return node
        } else {
        return nil
        }
    }
}
