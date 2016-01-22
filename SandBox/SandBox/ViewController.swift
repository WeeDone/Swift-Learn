//
//  ViewController.swift
//  SandBox
//
//  Created by XinJinquan on 2016/1/15.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var stringValue:String! {
        get {
            return
                NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
            

        } set {
            NSUbiquitousKeyValueStore.defaultStore().setString(newValue, forKey:"cloud_string")
            NSUbiquitousKeyValueStore.defaultStore().synchronize()
        }
    }
    var storeChangeObserver:AnyObject?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let pannle = NSOpenPanel()
//        pannle.canChooseDirectories = true
//        pannle.canChooseFiles = true
//        pannle.beginWithCompletionHandler { (result) -> Void in
//            _ = pannle.URL
//        }
        let _ = NSOperationQueue().addOperationWithBlock { () -> Void in
            let ubiqueityContainerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)
            print("UbiquetyContainerURL:\(ubiqueityContainerURL)")
        }
        self.createSotreObserver()
        
        // Do any additional setup after loading the view.
    }
    func createSotreObserver() {
        self.storeChangeObserver = NSNotificationCenter.defaultCenter().addObserverForName(NSUbiquitousKeyValueStoreDidChangeExternallyNotification
            , object: self
            , queue: NSOperationQueue.mainQueue()
            , usingBlock: { (notification) -> Void in
                self.willChangeValueForKey("stringValue")
                self.didChangeValueForKey("stringValue")
        })
    }
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

