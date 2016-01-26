//
//  ViewController.swift
//  SQJavaS
//
//  Created by XinJinquan on 2016/1/25.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    
    var SWebView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        SWebView = WKWebView(frame: self.view.bounds)
        SWebView.loadHTMLString(contents, baseURL: nil)
        self.view.addSubview(SWebView!)
        SWebView.UIDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        let alertController = UIAlertController(title: "java Script", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (ac) -> Void in
            completionHandler()
        }
        alertController.addAction(action)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void) {

    }
    func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void) {
        
        let alertController = UIAlertController(title: prompt, message: defaultText, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (ac) -> Void in
            completionHandler(alertController.textFields![0].text)
        }
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.text = defaultText!
        }
    
        alertController.addAction(action)
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

