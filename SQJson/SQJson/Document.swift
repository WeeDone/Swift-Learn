//
//  Document.swift
//  SQJson
//
//  Created by XinJinquan on 2016/1/18.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    @IBOutlet var checkBtn: NSButton!
    @IBOutlet var textField: NSTextField!
    var text = ""
    var check = true
    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        self.textField.stringValue = self.text
        self.checkBtn.integerValue = Int(self.check)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override var windowNibName: String? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return "Document"
    }

    override func dataOfType(typeName: String) throws -> NSData {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        //throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        
        let dic = ["Text":self.textField.stringValue,
                   "Checkbtn": self.checkBtn.integerValue]
        let jsonData = try! NSJSONSerialization.dataWithJSONObject(dic, options: [])
        return jsonData
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        //throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        let dic = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        self.text = dic["text"] as! String
        let value = dic["checked"] as! Int
        self.check = Bool(value)
    }


}

