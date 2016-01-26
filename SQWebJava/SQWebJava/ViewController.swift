//
//  ViewController.swift
//  SQWebJava
//
//  Created by XinJinquan on 2016/1/25.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController ,WKScriptMessageHandler{

    var webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userScript = WKUserScript(source: "", injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        userContentController.addScriptMessageHandler(self, name: "CCSS")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        self.view.addSubview(webView)
        webView = WKWebView(frame: self.view.bounds, configuration:configuration)

        let url = NSURL(string: "http://www.baidu.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        let a = ["a", "v", "f"]
        let c = "aaaaaaaaa"
        objc_setAssociatedObject(a, &key.b, c, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
               // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
private struct key {
    static var b = "ac"
}
//typealias wkScrpitMessageHandler = ViewController
//extension wkScrpitMessageHandler {
//    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
//        let person =
//        let bundleName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBoundleName")?.debugDescription
//        let personType = bundleName + "." + SQPerson
//        let personCls = NSClassFromString(personType) as! NSObject.Type //create dynamic class
//        
//        print(message.body)
//        let dic = message.body as! Dictionary<String, String>
//        let dic["className"]
//    }
//    
//}

