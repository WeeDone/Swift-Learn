//
//  ViewController.swift
//  SQBodyWeb
//
//  Created by XinJinquan on 2016/1/25.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView:WKWebView!
    var progressView:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.baidu.com")
        let request = NSURLRequest(URL: url!)
        self.addWebKitView()
        webView.loadRequest(request)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        webView.navigationDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func addWebKitView() {
        webView = WKWebView(frame: CGRectZero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        self.addProgressView()
        self.addViewConraints()
    }

    func addProgressView() {
        progressView = UIProgressView(progressViewStyle: .Default)
      //  self.addViewConraints()
        progressView.tintColor = UIColor.greenColor()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressView)
    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        
    }
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        self.progressView.hidden = true
    }
    func addViewConraints() {
        let viewMap = ["progressView": progressView, "webView": webView]
        let metrics = ["top": 20,"space": 0]
        var contrains = NSLayoutConstraint.constraintsWithVisualFormat("H:|-space-[webView]-space-|",
            options: [],
            metrics: metrics,
            views: viewMap)
            contrains += NSLayoutConstraint.constraintsWithVisualFormat("V:|-top-[progressView]-top-[webView]-|", options: [], metrics: metrics, views: viewMap)
       
            contrains += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[progressView]-space-|",
            options: [],
            metrics: metrics,
            views: viewMap)
        self.view.addConstraints(contrains)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

