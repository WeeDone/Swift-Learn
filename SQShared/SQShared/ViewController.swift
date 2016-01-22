//
//  ViewController.swift
//  SQShared
//
//  Created by XinJinquan on 2016/1/22.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func shared(sender: AnyObject) {
        let text = "share to everyone"
        let acitvityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.presentViewController(acitvityController, animated: true, completion: nil)
    }

    @IBAction func sharedImage(sender: AnyObject) {
        if let image = imageView.image {
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        }
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

