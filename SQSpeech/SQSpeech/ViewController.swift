//
//  ViewController.swift
//  SQSpeech
//
//  Created by XinJinquan on 2016/1/13.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit
import AVFoundation

var sysnthersize = AVSpeechSynthesizer()


class ViewController: UIViewController,
       UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
        override func viewDidLoad() {
        super.viewDidLoad()
//        let speech = AVSpeechUtterance(string: "你好")
//        speech.rate = 0.4
//        speech.pitchMultiplier = 0.1
//        let voice = AVSpeechSynthesisVoice(language: "zh-CN")
//        speech.voice = voice
//        sysnthersize.speakUtterance(speech)

        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func camera(sender: AnyObject) {
        let pickerContrller = UIImagePickerController()
        if  UIImagePickerController.isSourceTypeAvailable(.Camera) {
            if UIImagePickerController.isCameraDeviceAvailable(.Front) {
                pickerContrller.cameraDevice = .Front
            } else {
                pickerContrller.cameraDevice = .Rear
            }
            pickerContrller.delegate = self
            self.presentedViewController(pickerContrller, animationDidStop(true, finished: nil))
            self.presentedViewController(pickerContrller,
        }
    }

    @IBAction func addFromLib(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        self.presentedView(picker, animationDidStop(true, finished: nil))
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {

    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        image.image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
    }
    
    @IBAction func photoLib(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

