//
//  ViewController.swift
//  SQWeb
//
//  Created by XinJinquan on 2016/1/25.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("baidu", ofType: "html")
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        webView.loadHTMLString(contents, baseURL: nil)
        webView.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(__FUNCTION__)

    }
    func webViewDidStartLoad(webView: UIWebView) {
        print(__FUNCTION__)
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.URL!
        print(url.scheme)
        print(url.absoluteString)
        if url.scheme == "callMyCode" {
        let urlPath =  url.absoluteString.componentsSeparatedByString(":")
        print(urlPath)
        urlPath[1]
        let urlPaths = urlPath[1].componentsSeparatedByString("&")
        print(urlPaths[1])
        NSLog("is...", urlPaths[0],urlPath[1])
        let cont = UIAlertController(title: "JSS", message: urlPaths[0]+urlPaths[1], preferredStyle: .Alert)
        let acion = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        cont.addAction(acion)
        self.presentViewController(cont, animated: true, completion: nil)
        }
        return true;
    }
    func webViewDidFinishLoad(webView: UIWebView) {
      //  webView.stringByEvaluatingJavaScriptFromString("alert(\"hello ,js\")")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

