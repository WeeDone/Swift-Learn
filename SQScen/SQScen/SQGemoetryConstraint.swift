//
//  SQGemoetryConstraint.swift
//  SQScen
//
//  Created by XinJinquan on 2016/1/11.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SceneKit

class SQGemoetryConstraint: NSObject {

    static func pyramid() -> SCNNode {
        let pyramid =  SCNPyramid(width: 0.5, height: 0.9, length: 4.0)
        let node = SCNNode(geometry: pyramid)
        node.position = SCNVector3(-5, 0, 0)
        return node
        
    }
    static func addConstraint(fromNode:SCNNode, toNode:SCNNode) {
        let lookAtConsatraint = SCNLookAtConstraint(target: toNode)
        lookAtConsatraint.gimbalLockEnabled = true
        fromNode.constraints = [lookAtConsatraint]
        
    }
}
