//
//  Note.swift
//  SQControllerBind
//
//  Created by XinJinquan on 2016/1/18.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import Cocoa

class Note: NSObject {
    var title = "new note"
        {
        didSet {
            edited = NSDate()
        }
    }
    var text:NSAttributedString? = NSAttributedString(string: "new note")
        {
            didSet {
                createed = NSDate()
            }
    }
    var createed = NSDate()
    var edited = NSDate()
    
}
