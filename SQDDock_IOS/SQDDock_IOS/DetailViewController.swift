//
//  DetailViewController.swift
//  SQDDock_IOS
//
//  Created by XinJinquan on 2016/1/18.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {




    @IBOutlet var textView: UITextView!
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let document = self.detailItem as? SQDocument {
            if let aTextView = self.textView {
                  aTextView.text = document.text
            }
        }
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    
        if let document = self.detailItem as? SQDocument {
            document.text = self.textView.text 
            document.saveToURL(document.fileURL, forSaveOperation: .ForOverwriting, completionHandler:nil)
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

