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
    
    var selectedRow = -1
    
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
            self.selectPicker.hidden = true
        }
        else if self.ConfigurationNumber == 1 {
            
            textValue.text =  String(valuesArray[self.ConfigurationNumber] as Int)
            self.selectPicker.hidden = true
            
        }
        else if self.ConfigurationNumber == 2 {
            textValue.hidden = true            
          
        }
        else if self.ConfigurationNumber == 3
        {
            textValue.hidden = true
          }
        
    }
    
    
    @IBAction func pressedSave()
    {
        let config = Configuration()
        if self.ConfigurationNumber == 0 {
            config.setCode(textValue.text)
        }
        else if self.ConfigurationNumber == 1 {
            config.setNumberOfTries(textValue.text.toInt()!)
        }
        else if self.ConfigurationNumber == 2 {
            if ( self.selectedRow > -1) {
                config.setBestTimeOfDay(self.selectedRow)
            }
        }
        else if self.ConfigurationNumber == 3 {
            if ( self.selectedRow > -1) {
                config.setHowLongBetweenRequests(self.selectedRow)
            }
        }
        
        // Redo the notifications
        let noti = NotificationScheduler()
        noti.ChangesOnNotification()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
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
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        let config = Configuration()
        if self.ConfigurationNumber == 2
        {
            var timeOfDayString = config.getTimeOfTheDay()
            if ( config.getTimeOfTheDayValue() == timeOfDayString[row] as String) {
                pickerView.selectRow(row, inComponent: component, animated: false)
            }
            return timeOfDayString[row] as String
        }
        else if self.ConfigurationNumber == 3
        {
            var howOftenString = config.getHowOften()
            if ( config.getHowOftenValue() == howOftenString[row] as String) {
                pickerView.selectRow(row, inComponent: component, animated: false)
            }
            return howOftenString[row] as String
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if self.ConfigurationNumber == 2 {
            self.selectedRow = row + 1
        }
        else if self.ConfigurationNumber == 3
        {
            switch(row)
                {
            case 0:
                self.selectedRow = 1
                break
            case 1:
                self.selectedRow = 7
                break
            case 2:
                self.selectedRow = 30
                break
            case 3:
                self.selectedRow = 60
                break
            case 4:
                self.selectedRow = 90
                break
            default:
                self.selectedRow = 180
                break
            }
            
        }
    }
    
//    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
//    {
///*UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
//label.backgroundColor = [UIColor grayColor];
//label.textColor = [UIColor whiteColor];
//label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
//label.text = [NSString stringWithFormat:@" %d", row+1];
//return label;*/
//        
//        var label = view as UILabel
//        label.textColor = UIColor.whiteColor()
//        
//        return label
//    }

}
