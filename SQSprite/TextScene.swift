//
//  TextScene.swift
//  SQSprite
//
//  Created by XinJinquan on 2016/1/8.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SpriteKit

class TextScene: SKScene {

    override func didMoveToView(view: SKView) {
        let textNode = SKLabelNode(text:"Hello....")
        textNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
     self .addChild(textNode)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let spriteScene = SQSpriteScene(size:(self.view?.frame.size)!)
        let transition = SKTransition.moveInWithDirection(SKTransitionDirection.Left, duration: 1)
        self.view?.presentScene(spriteScene, transition: transition)
    }
}
