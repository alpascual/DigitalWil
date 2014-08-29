//
//  NotificationScheduler.swift
//  FrostedSidebar
//
//  Created by Al Pascual on 8/29/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class NotificationScheduler: NSObject {
   
    override init() {
        
    }
    
    func ChangesOnNotification()
    {
        let configuration = Configuration()
        if ( configuration.Code.isEmpty == false ) {
            UIApplication.sharedApplication().cancelAllLocalNotifications()
            self.ScheduleAll()
        }
    }
    
    func ScheduleAll()
    {
        let notification = UILocalNotification()
        let configuration = Configuration()
        configuration.getNumberOfTriesValue()
        
        // Schedule first one
        var seconds : Double = Double(configuration.getHowOftenValue().toInt()!)
        var days = (((seconds * 60) * 60) * 24)
        notification.fireDate = NSDate(timeIntervalSinceNow: days)
        notification.alertBody = "Confirm you are still alive and well by clicking the notification"
        notification.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
        // Schedule number of tries
        var lastday = days
        for var i = 0; i < configuration.getNumberOfTriesValue(); i++ {
            let tempNotification = UILocalNotification()
            // increasing one day
            lastday = lastday + Double((((i * 60) * 60) * 24))
            tempNotification.fireDate = NSDate(timeIntervalSinceNow: lastday)
            tempNotification.alertBody = "Remaining " + String(configuration.getNumberOfTriesValue()-i) + " days before showing the password"
            tempNotification.timeZone = NSTimeZone.defaultTimeZone()
            UIApplication.sharedApplication().scheduleLocalNotification(tempNotification)
        }
        
        // Last notification showing the password
        let lastNotification = UILocalNotification()
        lastday = lastday + Double((((1 * 60) * 60) * 24))
        lastNotification.fireDate = NSDate(timeIntervalSinceNow: lastday)
        lastNotification.alertBody = "The owner of the phone is gone, unlock it, this is the password: " + configuration.Code
        lastNotification.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(lastNotification)
        
        // One last one in case
        let lastNotification2 = UILocalNotification()
        lastday = lastday + Double((((1 * 60) * 60) * 24))
        lastNotification2.fireDate = NSDate(timeIntervalSinceNow: lastday)
        lastNotification2.alertBody = "The owner of the phone is gone, unlock it, this is the password: " + configuration.Code + " last communication"
        lastNotification2.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(lastNotification2)
        
    }
}
