//
//  AppDelegate.swift
//  SQEvent
//
//  Created by XinJinquan on 2016/1/22.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import Cocoa
import EventKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var date = NSDate() {
        willSet {
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day, .Year, .Month], fromDate: NSDate())
            self.date = calendar.dateFromComponents(components)!
            print(self.date)
        }
    }
    var calendars:[EKCalendar]{
        return self.store.calendarsForEntityType(.Event)
    }
    var events:[EKEvent] {
        let endDate = self.date.dateByAddingTimeInterval(24 * 60 * 60)
        let perdicate = self.store.predicateForEventsWithStartDate(self.date, endDate: endDate, calendars: self.calendars)
        return self.store.eventsMatchingPredicate(perdicate)
    }
    lazy var store = EKEventStore()
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.store.requestAccessToEntityType(.Event){
             (success, error) -> Void in
            if !success {
                print(error)
            }
           
        }
        self.date = NSDate()
         print(self.date)
        print(self.events.count)
    }
    class func keyPathsForValuesAffectingEvents() ->NSSet! {
        return NSSet(object: "date")                                                                                
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

