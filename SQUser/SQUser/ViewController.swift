//
//  ViewController.swift
//  SQUser
//
//  Created by XinJinquan on 2016/1/15.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sandardDefaluts = NSUserDefaults.standardUserDefaults()
        //sandardDefaluts.registerDefaults(defaluts)
        sandardDefaluts.setObject(10, forKey: "box")
        
        print(sandardDefaluts.objectForKey("box"))
        self.createFile()
        //self.deleteFile()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: create file 
    func createFile() {
        
        let fileManager = NSFileManager.defaultManager()
        let documentDir = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirs = documentDir[0]
        let newDirInDocuDir = documentDirs.URLByAppendingPathComponent("DKK")
        print(documentDir)
        do {
        try fileManager.createDirectoryAtURL(newDirInDocuDir, withIntermediateDirectories: false, attributes: nil)

        } catch {
            print(error)
        
        }

        do {
        try fileManager.contentsOfDirectoryAtURL(documentDirs, includingPropertiesForKeys: nil, options: [])
            let temporaryDirectory = NSTemporaryDirectory()
        } catch {
            print(error)
        }
        let temp = NSTemporaryDirectory()
        let newTempDir = temp + "DKK"
        let newTempDirUrl = NSURL.fileURLWithPath(newTempDir)
        do {
            try fileManager.moveItemAtURL(newDirInDocuDir, toURL: newTempDirUrl)
            
        } catch {
            print(error)
        }
        
        let text = "This is a Text for the one."
        let textData = text.dataUsingEncoding(NSUTF8StringEncoding)
        let textTemp = temp + "/text"
        fileManager.createFileAtPath(textTemp, contents: textData, attributes: nil)
    }
    func deleteFile() {
        let fileManager = NSFileManager.defaultManager()
        let documentDir = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirs = documentDir[0]
        let newDirInDocuDir = documentDirs.URLByAppendingPathComponent("DKK")

        do {
            try fileManager.removeItemAtURL(newDirInDocuDir)
        } catch {
            print(error)
        }
    }
    func moveFile() {
        let fileManager = NSFileManager.defaultManager()
        let documentDir = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirs = documentDir[0]
        let newDirInDocuDir = documentDirs.URLByAppendingPathComponent("DKK")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

