//
//  SQDocument.swift
//  SQDDock_IOS
//
//  Created by XinJinquan on 2016/1/18.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit


class SQDocument: UIDocument {

    var text = ""

    override func loadFromContents(contents: AnyObject, ofType typeName: String?) throws {
        self.text = String(data: contents as! NSData, encoding: NSUTF8StringEncoding)!
    }
    override func contentsForType(typeName: String) throws -> AnyObject {
           return self.text.dataUsingEncoding(NSUTF8StringEncoding)!
    
    }
}
