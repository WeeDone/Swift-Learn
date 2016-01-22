//
//  ViewController.swift
//  SQTableView
//
//  Created by XinJinquan on 2016/1/20.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var number = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            number.append(i)

        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("cell") as! SQTableViewCell
        //let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuserIndentifier, forIndexPath: indexPath)
        cell.textLabel!.text = " \(number[indexPath.row])"
        return cell 

        
    }
    private struct Storyboard {
        static let CellReuserIndentifier = "cell"
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

