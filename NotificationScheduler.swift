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
        
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        
    }
    
    func ScheduleAll()
    {
        let notification = UILocalNotification()
        let configuration = Configuration()
        configuration.getNumberOfTriesValue()
        
        /*UILocalNotification* localNotification = [[UILocalNotificationalloc] init];
        localNotification.fireDate = [NSDatedateWithTimeIntervalSinceNow:30];
        localNotification.alertBody = @"Alert message goes here";
        localNotification.timeZone = [NSTimeZonedefaultTimeZone];
        [[UIApplicationsharedApplication] scheduleLocalNotification:localNotification];*/
        
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
            lastday = lastday + Double(i)
            tempNotification.fireDate = NSDate(timeIntervalSinceNow: lastday)
            tempNotification.alertBody = "Remaining " + String(configuration.getNumberOfTriesValue()-i) + " days before showing the password"
            tempNotification.timeZone = NSTimeZone.defaultTimeZone()
            UIApplication.sharedApplication().scheduleLocalNotification(tempNotification)
        }
        
        // Last notification showing the password
        
    }
}
