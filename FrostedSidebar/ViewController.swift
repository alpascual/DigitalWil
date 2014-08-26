//
//  ViewController.swift
//  CustomStuff
//
//  Created by Evan Dekhayser on 7/9/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class ViewController: MasterPage,UIPickerViewDataSource, UIPickerViewDelegate {
    
	
    @IBOutlet var alertSlider: UISlider!
    @IBOutlet var timePicker: [UIPickerView]!
    let timeArray = ["Daily","Monthly","Every 3 Months", "Every 6 Months"]
    
	override func viewDidLoad() {
        
        viewControllerIndex = 0
        
		super.viewDidLoad()
        
        self.timePicker![0].dataSource = self
        self.timePicker![0].delegate = self
        
        // Init the configuration
        let configuration = Configuration()
        
	}
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int
    {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int
    {
        return self.timeArray.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return self.timeArray[row]
    }
    
}

