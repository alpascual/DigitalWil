//
//  AppDelegate.swift
//  CustomStuff
//
//  Created by Evan Dekhayser on 7/9/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        
        let Device = UIDevice.currentDevice()
        let iosVersion = NSString(string: Device.systemVersion).doubleValue
        let iOS8 = iosVersion >= 8
        let iOS7 = iosVersion >= 7 && iosVersion < 8
        
        if iOS8
        {
            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound | UIUserNotificationType.Alert | UIUserNotificationType.Badge, categories: nil))
        }
        else if iOS7
        {
            //do iOS 7 stuff, which is pretty much nothing for local notifications.
        }
        
        let noti = NotificationScheduler()
        noti.ChangesOnNotification()
        
        if launchOptions != nil {
            if launchOptions == UIApplicationLaunchOptionsLocalNotificationKey {
                // Maybe show a screen to thank the user
                
                //Cannot do that as I don't know if was after displaying the password
                //HUDController.sharedController.contentView = HUDContentView.TextView(text: "Got it, you still alive and well.")
                //HUDController.sharedController.show()
                //HUDController.sharedController.hide(afterDelay: 2.0)
            }
        }
        
        if application.applicationIconBadgeNumber > 0
        {
            HUDController.sharedController.contentView = HUDContentView.TextView(text: "Got it, you still alive and well. Rescheduling for a later date ...")
            HUDController.sharedController.show()
            HUDController.sharedController.hide(afterDelay: 2.0)
        }
        
        
        
        application.applicationIconBadgeNumber = 0
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

