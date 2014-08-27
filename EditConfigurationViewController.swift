//
//  EditConfigurationViewController.swift
//  FrostedSidebar
//
//  Created by Al Pascual on 8/26/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class EditConfigurationViewController: UIViewController {

    
    var ConfigurationNumber : Int = 0
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textValue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch(self.ConfigurationNumber)
        {
            // Code
            case 0:
            descriptionLabel.text = "Enter the code or password you use to unlock the phone, this will be only displayed after the user does not reply to any alert"
            break
            
            case 1:
            descriptionLabel.text = "After you didn't answer, how many times the phone needs to try before displaying your device lock code?"
            break
            
            case 2:
            descriptionLabel.text = "When is the best time of the day to get the alert on your phone without bothering you too much?"
            break
            
            default:
            descriptionLabel.text = "How much you want to be bothered by the alerts? Make sure is not too long, as your next of kin may don't want to wait to long"
            break
            
        }
        
        let config = Configuration()
        var valuesArray = config.getConfigurationArray()
        
        if self.ConfigurationNumber == 0 {
            textValue.text = valuesArray[self.ConfigurationNumber] as String
            textValue.secureTextEntry = true
        }
        else if self.ConfigurationNumber == 1 {
            textValue.text =  String(valuesArray[self.ConfigurationNumber] as Int)
        }
        else if self.ConfigurationNumber == 2 {
            var timeOfDay = valuesArray[self.ConfigurationNumber] as Int
            textValue.tag = timeOfDay
            switch(timeOfDay)
                {
            case 1:
                textValue.text = "Morning"
                break
            case 2:
                textValue.text = "Afternoon"
                break
            default:
                textValue.text = "Evening"
                break
            }
        }
        else if self.ConfigurationNumber == 3
        {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
