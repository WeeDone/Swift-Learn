//
//  ViewController.swift
//  SQCocoaApp
//
//  Created by XinJinquan on 2016/1/13.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer:AVAudioPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioUrl = NSBundle.mainBundle().URLForResource("TextSound", withExtension: "wav")

        do {
            audioPlayer = try! AVAudioPlayer(contentsOfURL: audioUrl!)

        } catch {
            print(error)
        }
        //audioPlayer =  AVAudioPlayer(contentsOfURL: audioUrl!)
      
        audioPlayer.numberOfLoops = -1
        audioPlayer.volume = 1
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

