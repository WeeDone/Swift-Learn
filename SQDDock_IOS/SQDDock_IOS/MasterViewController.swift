//
//  MasterViewController.swift
//  SQDDock_IOS
//
//  Created by XinJinquan on 2016/1/18.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var documentURL = [NSURL]()
    private let fileManager = NSFileManager.defaultManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        print(self.documentsURL())
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
        self.updateDocumentURls()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: TableViewDelagate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let documentOpen = SQDocument(fileURL:self.documentURL[indexPath.row])
        documentOpen.openWithCompletionHandler { (success) -> Void in
            self.performSegueWithIdentifier("showDetail", sender: documentOpen)
        }
        
    }

    // MARK: document 
    private func documentsURL() -> NSURL {
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[0]
    }
    func updateDocumentURls() {
        do {
        self.documentURL = try  fileManager.contentsOfDirectoryAtURL(self.documentsURL(),
            includingPropertiesForKeys: nil,
            options: .SkipsHiddenFiles)
        } catch {
                print(error)
            }
    }
    func formatDate() ->String {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:MM:ssZZZ"
       return dateFormat.stringFromDate(NSDate())
        
    }
    func insertNewObject(sender: AnyObject) {
        let url = self.documentsURL().URLByAppendingPathComponent(self.formatDate())
        let documentToCreate = SQDocument(fileURL: url)
        documentToCreate.saveToURL(url, forSaveOperation: .ForCreating) { (success) -> Void in
            if success {
                self.performSegueWithIdentifier("showDetail", sender: documentToCreate)
            }
        }
    }
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
          

                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                
                controller.detailItem = sender as! SQDocument
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentURL.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let url = self.documentURL[indexPath.row]
        cell.textLabel!.text = url.lastPathComponent
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            documentURL.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

