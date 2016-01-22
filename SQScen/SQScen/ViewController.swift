//
//  ViewController.swift
//  SQScen
//
//  Created by XinJinquan on 2016/1/11.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SceneKit
class ViewController: UIViewController {

    var delegate: TapRecongizerDelegate!
    func tapped(tap:UITapGestureRecognizer) {
        let scnView = self.view as! SCNView
        delegate?.didTapped(tap, scnView: scnView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let sceView = self.view as! SCNView
        sceView.backgroundColor = UIColor.grayColor()
        let scene = self.scence()
        sceView.scene = scene
        
        let cameraNode = self.createCameraNode()
        scene.rootNode.addChildNode(cameraNode)
        
        let capsuleNode = self.createCapsuleNode()
        scene.rootNode.addChildNode(capsuleNode)
        
        let ambientL = createAmibeintLightNode()
        scene.rootNode.addChildNode(ambientL)
        
        let omnilL = omnLightNode()
        scene.rootNode.addChildNode(omnilL)
        
        let moveUpAnimation = self.moveUpDownAnimation()
        capsuleNode.addAnimation(moveUpAnimation, forKey: "updown")
        
        let text = self.textNode()
        capsuleNode.addChildNode(text)
        
        let rotate = self.rotateAnimation()
        capsuleNode.addAnimation(rotate, forKey: "rotation")
        
        let tapReconizer = SQTapReconginzer()
        tapReconizer.addTapReconginzer(self, view: sceView)
        
        let pyramid = SQGemoetryConstraint.pyramid()
        SQGemoetryConstraint.addConstraint(pyramid, toNode: capsuleNode)
        scene.rootNode.addChildNode(pyramid)
        
        let critterNode = SQDaeNode.nodeInDae()
        scene.rootNode.addChildNode(critterNode!)
        
        let body = SQPhysicBody.SQPhysicBody(critterNode!)
        critterNode?.physicsBody = body 
        
        let boy = SQPhysicBody.SQPhysicBody(capsuleNode)
        capsuleNode.physicsBody = boy

        SQFloor.addFloor(scene)

        // Do any additional setup after loading the view, typically from a nib.
    }
    func scence() ->SCNScene{
        let scene = SCNScene()
        return scene
    }
      //MARK: crate animation
    func moveUpDownAnimation() -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.byValue = NSValue(SCNVector3: SCNVector3(0, 5, 0))
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.duration = 2
        return animation
    }
    // MARK: Crate text
    func text() -> SCNText {
        let text = SCNText(string: "     Hello,Scenn", extrusionDepth: 0.2)
        text.font = UIFont.systemFontOfSize(1, weight: 2)
        //text.materials = [self.colorMaterial()]
        return text
    }
    func textNode() -> SCNNode {
        let textNode = SCNNode(geometry: self.text())
        textNode.position = SCNVector3(-5, 1, 5)
        return textNode
        
    }
    //MARK: ColorMaterial
    func colorMaterial() -> SCNMaterial {
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.redColor()
        material.specular.contents = UIColor.whiteColor()
        material.shininess = 1.0
        return material
    }
    //MARK: rotateAnimation 
    func rotateAnimation() -> CAAnimation {
        let rotate = CABasicAnimation(keyPath: "eulerAngles")
        rotate.byValue = NSValue(SCNVector3: SCNVector3(0, Float(M_PI * 2), 0))
       
        rotate.repeatCount = Float.infinity
        rotate.duration = 4
        return rotate
    }
    
    //MARK: Crate light
    func createAmibientLight() -> SCNLight {
        let amibientLight = SCNLight()
        amibientLight.color = UIColor(white: 0.2, alpha: 1)
        amibientLight.type = SCNLightTypeDirectional
        return amibientLight
    }
    func createAmibeintLightNode() -> SCNNode {
        let node = SCNNode()
        node.light = createAmibientLight()
        return node 
    }
    //MARK: create Omnillight
    func omnilight() -> SCNLight {
        let omnLight = SCNLight()
        omnLight.type = SCNLightTypeOmni
        return omnLight
    }
    func omnLightNode() -> SCNNode {
        let node = SCNNode()
        node.light = omnilight()
        node.position = SCNVector3(0, 0, 20)
        return node
        
    }
  
    
    //MARK: Create cap
    func createCapsule() -> SCNCapsule {
        let capsuple = SCNCapsule(capRadius: 2.5, height: 10)
        
        return capsuple
    }
    func createCapsuleNode() -> SCNNode {
        let capsule =  self.createCapsule()
        let material = SQMaterial()
        material.textuerMaterial()
        capsule.materials = [material]
        let capsuleNode = SCNNode(geometry: capsule)
        
        capsuleNode.position = SCNVector3(0, 0, 0)
        return capsuleNode
    }
    
    //MARK: CreateCamera()
    func createCamera() -> SCNCamera {
        let camera = SCNCamera()
        camera.xFov = 45
        camera.yFov = 75
        return camera
    }
    func createCameraNode() -> SCNNode {
        let createNode = SCNNode()
        let camera = self.createCamera()
        createNode.camera = camera
        createNode.position = SCNVector3(0, 0, 20)
        return createNode 
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

