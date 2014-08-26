//
//  Configuration.swift
//  FrostedSidebar
//
//  Created by Al Pascual on 8/26/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import Foundation



class Configuration
{
    let Code = "Configuration_Code"
    let NumberOfTries = "Configuration_NumberOfTries"
    let BestTimeOfDay = "Configuration_BestTimeOfDay"
    let HowLongBetweenRequests = "Configuration_HowLongBetweenRequests"
    
    init()
    {
        var defaults = NSUserDefaults()
        if defaults.objectForKey(NumberOfTries) == nil {
            defaults.setInteger(5, forKey: NumberOfTries)
        }
        if defaults.objectForKey(BestTimeOfDay) == nil {
            defaults.setInteger(1, forKey: BestTimeOfDay) // Morning
        }
        if defaults.objectForKey(HowLongBetweenRequests) == nil {
            defaults.setInteger(30, forKey: HowLongBetweenRequests) // Month
        }
        
        defaults.synchronize()
    }
    
    func getConfigurationArray() -> NSArray
    {
        var configuration : NSMutableArray = []
        let defaults = NSUserDefaults()
        
        var code: AnyObject? = defaults.objectForKey(Code) != nil ? defaults.objectForKey(Code) : ""
        configuration.addObject(code!)
        
        configuration.addObject(defaults.objectForKey(NumberOfTries)!)
        configuration.addObject(defaults.objectForKey(BestTimeOfDay)!)
        configuration.addObject(defaults.objectForKey(HowLongBetweenRequests)!)
        
        return configuration
    }
    
    func convertValueFor(obj : AnyObject!, position: Int) -> String
    {
        switch(position)
        {
        case 0:
            return "•••••••••"
        case 1:
            return String(obj as Int)
        case 2:
            switch(obj as Int)
            {
            case 1:
                return "Morning"
            case 2:
                return "Afternoon"
            default:
                return "Evening"
            }
        case 3:
            switch(obj as Int)
            {
            case 1:
                return "Every Day"
            case 7:
                return "Weekly"
            case 30:
                return "Montly"
            case 60:
                return "Every 2 months"
            case 90:
                return "Every 3 months"
            case 180:
                return "Every 6 months"
            default:
                return "Never"
            }
        default:
            return ""
        }
    }
}