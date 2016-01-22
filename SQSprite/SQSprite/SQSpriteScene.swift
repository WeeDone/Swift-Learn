//
//  SQSpriteScene.swift
//  SQSprite
//
//  Created by XinJinquan on 2016/1/8.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SpriteKit

class SQSpriteScene: SKScene {
    override func didMoveToView(view: SKView) {
        let  spriteNode = SKSpriteNode(imageNamed: "Sprite")
        spriteNode.position =  CGPoint(x: size.width / 2, y: size.height / 2)
        self.addChild(spriteNode)
    }

}
