//
//  SQPhysicBody.swift
//  SQScen
//
//  Created by XinJinquan on 2016/1/11.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SceneKit
class SQPhysicBody: NSObject {
    static func SQPhysicBody(node: SCNNode) -> SCNPhysicsBody {
        var shape: SCNPhysicsShape?
        if let geometry = node.geometry {
            shape = SCNPhysicsShape(geometry: geometry, options: nil)
        }
            let p_body = SCNPhysicsBody(type: SCNPhysicsBodyType.Dynamic, shape: shape)
            return p_body
    }
    

}
