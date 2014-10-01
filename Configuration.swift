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
    
    let ConfigurationText = "Configuration_Text"
    
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
    
    func setCode(valueString: String)
    {
        var defaults = NSUserDefaults()
        defaults.setObject(valueString, forKey: Code)
        defaults.synchronize()
    }
    func setNumberOfTries(value: Int)
    {
        var defaults = NSUserDefaults()
        defaults.setInteger(value, forKey: NumberOfTries)
        defaults.synchronize()
    }
    func setBestTimeOfDay(value: Int)
    {
        var defaults = NSUserDefaults()
        defaults.setInteger(value, forKey: BestTimeOfDay)
        defaults.synchronize()
    }
    func setHowLongBetweenRequests(value: Int)
    {
        var defaults = NSUserDefaults()
        defaults.setInteger(value, forKey: HowLongBetweenRequests)
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
    
    func getTimeOfTheDay() -> NSArray
    {
        return ["Morning","Afternoon", "Evening"]
    }
    
    func getHowOften() -> NSArray
    {
        return ["Every Day","Weekly", "Monthly", "Every 2 months", "Every 3 months", "Every 6 months", "Never"]
    }
    
    func getCodeValue() -> String
    {
        var defaults = NSUserDefaults()
        return defaults.objectForKey(Code) as String
    }
    
    func getNumberOfTriesValue() ->Int
    {
        var defaults = NSUserDefaults()
        return defaults.objectForKey(NumberOfTries) as Int
    }
    
    func getTimeOfTheDayValue() -> String
    {
        var defaults = NSUserDefaults()
        return self.convertValueFor(defaults.objectForKey(BestTimeOfDay) as Int, position: 2)
    }
    
    func getHowOftenValue() -> String
    {
        var defaults = NSUserDefaults()
        return self.convertValueFor(defaults.objectForKey(HowLongBetweenRequests) as Int, position: 3)
    }
    
    func convertValueFor(obj : AnyObject!, position: Int) -> String
    {
        println(obj)
        
        var timeOfDay = self.getTimeOfTheDay()
        var howOften = self.getHowOften()
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
                return timeOfDay[0] as String
            case 2:
                return timeOfDay[1] as String
            default:
                return timeOfDay[2] as String
            }
        case 3:
            switch(obj as Int)
            {
            case 1:
                return howOften[0] as String
            case 7:
                return howOften[1] as String
            case 30:
                return howOften[2] as String
            case 60:
                return howOften[3] as String
            case 90:
                return howOften[4] as String
            case 180:
                return howOften[5] as String
            default:
                return howOften[6] as String
            }
        default:
            return ""
        }
    }
    
    
    func getLegacyText() -> String
    {
        var defaults = NSUserDefaults()
        if defaults.objectForKey(ConfigurationText) != nil
        {
            var text : String! = defaults.objectForKey(ConfigurationText) as String
            if text == nil {
                text = "Add any extra message you want here..."
            }
            
            return text
        }
        
        return "Nothing yet"
    }
    
    func setLegacyText(text : String)
    {
        var defaults = NSUserDefaults()
        defaults.setObject(text, forKey: ConfigurationText)
        defaults.synchronize()
    }
}