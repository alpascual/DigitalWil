//
//  EditConfigurationViewController.swift
//  FrostedSidebar
//
//  Created by Al Pascual on 8/26/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class EditConfigurationViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    
    var ConfigurationNumber : Int = 0
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textValue: UITextField!
    @IBOutlet var selectPicker: UIPickerView!
    
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
        var timeOfDayString = config.getTimeOfTheDay()
        var howOftenString = config.getHowOften()
        
        self.selectPicker!.dataSource = self
        self.selectPicker!.delegate = self
        
        if self.ConfigurationNumber == 0 {
            textValue.text = valuesArray[self.ConfigurationNumber] as String
            textValue.secureTextEntry = true
        }
        else if self.ConfigurationNumber == 1 {
            
            textValue.text =  String(valuesArray[self.ConfigurationNumber] as Int)
            
        }
        else if self.ConfigurationNumber == 2 {
            textValue.hidden = true
            var timeOfDay = valuesArray[self.ConfigurationNumber] as Int
            textValue.tag = timeOfDay
            switch(timeOfDay)
                {
            case 1:
                textValue.text = timeOfDayString[0] as String
                break
            case 2:
                textValue.text = timeOfDayString[1] as String
                break
            default:
                textValue.text = timeOfDayString[2] as String
                break
            }
        }
        else if self.ConfigurationNumber == 3
        {
            textValue.hidden = true
            var howOften = valuesArray[self.ConfigurationNumber] as Int
            textValue.tag = howOften
            switch(howOften)
                {
            case 1:
                textValue.text = howOftenString[0] as String
                break
            case 7:
                textValue.text = howOftenString[1] as String
                break
            case 30:
                textValue.text = howOftenString[2] as String
                break
            case 60:
                textValue.text = howOftenString[3] as String
                break
            case 90:
                textValue.text = howOftenString[4] as String
                break
            case 180:
                textValue.text = howOftenString[5] as String
                break
            default:
                textValue.text = howOftenString[6] as String
                break
                
            }
        }
        
    }
    
    @IBAction func pressedSave()
    {
        
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
    
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int
    {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int
    {
        let config = Configuration()
        if self.ConfigurationNumber == 2
        {
            var timeOfDayString = config.getTimeOfTheDay()
            return timeOfDayString.count
        }
        else if self.ConfigurationNumber == 3
        {
            var howOftenString = config.getHowOften()
            return howOftenString.count
        }       
        return 0
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!
    {
        let config = Configuration()
        if self.ConfigurationNumber == 2
        {
            var timeOfDayString = config.getTimeOfTheDay()
            return timeOfDayString[row] as String
        }
        else if self.ConfigurationNumber == 3
        {
            var howOftenString = config.getHowOften()
            return howOftenString[row] as String
        }
        return ""
    }

}
