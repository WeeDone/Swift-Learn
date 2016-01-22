//
//  SQTapReconginzer.swift
//  SQScen
//
//  Created by XinJinquan on 2016/1/11.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SceneKit

protocol TapRecongizerDelegate {
    func didTapped(tapRecongizer: UITapGestureRecognizer,
                        scnView: SCNView)
}

class SQTapReconginzer: NSObject, TapRecongizerDelegate {
    
    func addTapReconginzer(viewController: ViewController, view: SCNView) {
        let tapReconginzer = UITapGestureRecognizer(target: viewController, action: "tapped:")
        view.addGestureRecognizer(tapReconginzer)
        view.userInteractionEnabled = true
        viewController.delegate = self
    }
    
    
    func didTapped(tapRecongizer: UITapGestureRecognizer, scnView: SCNView) {
        if tapRecongizer.state == UIGestureRecognizerState.Ended {
           let hits = scnView.hitTest(tapRecongizer.locationInView(tapRecongizer.view), options: nil)
            //let hits = scnView.hitTest(tapRecongizer.locationInView(tapRecongizer.view), options: nil)
            
            for hit in hits {
                if let material = hit.node.geometry?.materials[0] {
                    let highLightAnimation = CABasicAnimation(keyPath: "contents")
                    highLightAnimation.fromValue = UIColor.blackColor()
                    highLightAnimation.toValue = UIColor.yellowColor()
                    highLightAnimation.duration = 1
                    material.emission.addAnimation(highLightAnimation, forKey:"highLight")
                }
            }
        }
    }
}
