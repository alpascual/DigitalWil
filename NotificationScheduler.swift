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
        
        var defaults = NSUserDefaults()
        var isThere: AnyObject? = defaults.objectForKey(configuration.Code)
        var isThereHowOften : AnyObject? = defaults.objectForKey(configuration.HowLongBetweenRequests)
        var isThereRepeat : AnyObject? = defaults.objectForKey(configuration.NumberOfTries)
        
        if ( isThere != nil  && isThereHowOften != nil && isThereRepeat != nil) {
            UIApplication.sharedApplication().cancelAllLocalNotifications()
            self.ScheduleAll()
            //HUDController.sharedController.contentView = HUDContentView.TextView(text: "Alerts have been scheduled")
        }
        else
        {
            // Display a message that you need all the info and code to be setup
            HUDController.sharedController.contentView = HUDContentView.TextView(text: "Need to set up a code to schedule alerts")
        }
        
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
    }
    
    func ScheduleAll()
    {
        var defaults = NSUserDefaults()
        let notification = UILocalNotification()
        let configuration = Configuration()
        
        // Schedule first one
        var betweenRequests = defaults.objectForKey(configuration.HowLongBetweenRequests) as Int
        var seconds : Double = Double(betweenRequests)
        var days = self.convertSecondsToDays(seconds)
        notification.fireDate = self.insidePreferedWindow(NSDate(timeIntervalSinceNow: days))
        notification.applicationIconBadgeNumber=notification.applicationIconBadgeNumber+1
        notification.alertBody = "Confirm you are still alive and well by clicking the notification"
        notification.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
        // Schedule number of tries
        var lastday = days
        var numberOfTries = defaults.objectForKey(configuration.NumberOfTries) as Int
        for var i = 0; i < numberOfTries; i++ {
            let tempNotification = UILocalNotification()
            // increasing one day
            lastday = lastday + self.convertSecondsToDays(Double(i))
            tempNotification.fireDate = self.insidePreferedWindow(NSDate(timeIntervalSinceNow: lastday))
            tempNotification.alertBody = "Remaining " + String(configuration.getNumberOfTriesValue()-i) + " days before showing the password"
            tempNotification.timeZone = NSTimeZone.defaultTimeZone()
            UIApplication.sharedApplication().scheduleLocalNotification(tempNotification)
        }
        
        // Last notification showing the password
        let lastNotification = UILocalNotification()
        lastday = lastday + self.convertSecondsToDays(1)
        lastNotification.fireDate = self.insidePreferedWindow(NSDate(timeIntervalSinceNow: lastday))
        lastNotification.alertBody = "The owner of the phone is gone, unlock it, this is the password: " + configuration.getCodeValue()
        lastNotification.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(lastNotification)
        
        // One last one in case
        let lastNotification2 = UILocalNotification()
        lastday = lastday + self.convertSecondsToDays(1)
        lastNotification2.fireDate = self.insidePreferedWindow(NSDate(timeIntervalSinceNow: lastday))
        lastNotification2.alertBody = "The owner of the phone is gone, unlock it, this is the password: " + configuration.getCodeValue() + " last communication"
        lastNotification2.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(lastNotification2)
        
    }
    
    func convertSecondsToDays(seconds: Double) -> Double
    {
        var days = (((seconds * 60) * 60) * 24)
        return days
    }
    
    func insidePreferedWindow(date : NSDate) -> NSDate
    {
        println(date)
        
        //Make sure the timer is on their selected window
        let calendar = NSCalendar.currentCalendar()
        var conponents : NSDateComponents = calendar.components(NSCalendarUnit.HourCalendarUnit, fromDate: date)
        println(conponents)
        var hour = conponents.hour
        
        let configuration = Configuration()
        var timeOfDay = configuration.getTimeOfTheDayValue()
        var max = 24
        var min = 19
        if ( timeOfDay == "Morning")
        {
            max = 11
            min = 8
        }
        else if ( timeOfDay == "Afternoon")
        {
            max = 18
            min = 12
        }
        
        while ( hour < min || hour > max)
        {
            hour = hour + 1
            if hour > 24
            {
                hour = 0
            }
        }
        
        conponents.hour = hour
        return calendar.dateFromComponents(conponents)!
        
        //return date
    }
}
