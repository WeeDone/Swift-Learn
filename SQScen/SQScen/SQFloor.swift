//
//  SQFloor.swift
//  SQScen
//
//  Created by XinJinquan on 2016/1/11.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SceneKit
class SQFloor: NSObject {
    static func addFloor(scene:SCNScene) {
        let floor = SCNFloor()
        let node = SCNNode(geometry: floor)
        node.position = SCNVector3(0, -4, 0)
        let body = SCNPhysicsBody(type: SCNPhysicsBodyType.Static, shape: SCNPhysicsShape(geometry: floor, options: nil))
        node.physicsBody = body
        scene.rootNode.addChildNode(node)
    }
}
