//
//  SQMaterial.swift
//  SQScen
//
//  Created by XinJinquan on 2016/1/11.
//  Copyright © 2016年 Sim.quantum. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit
class SQMaterial: SCNMaterial {

    func textuerMaterial(noiserTexture: SKTexture? =
        SKTexture(noiseWithSmoothness:0.25,
                                 size: CGSize (width: 512, height: 512),
                            grayscale: true)) {
        let normalTexture =
            noiserTexture?.textureByGeneratingNormalMapWithSmoothness(0.1, contrast: 1)
        self.normal.contents = normalTexture
        self.diffuse.contents = noiserTexture
    }
}
