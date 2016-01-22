//
//  ViewController.swift
//  SQClound_ios
//
//  Created by XinJinquan on 2016/1/15.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    

 var storeChangeObserver:AnyObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createSotreObserver() 
        // Do any additional setup after loading the view, typically from a nib.
    }
    func createSotreObserver() {
        self.showText.text = NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
        storeChangeObserver = NSNotificationCenter.defaultCenter().addObserverForName(NSUbiquitousKeyValueStoreDidChangeExternallyNotification
            , object: self
            , queue: NSOperationQueue.mainQueue()
            , usingBlock: { (notification) -> Void in
               self.showText.text = NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
        })
    }
    @IBOutlet weak var showText: UITextField!
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.showText.resignFirstResponder()
        NSUbiquitousKeyValueStore.defaultStore().setString(self.showText.text, forKey: "cloud_string")
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

