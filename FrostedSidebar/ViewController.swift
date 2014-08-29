//
//  ViewController.swift
//  CustomStuff
//
//  Created by Evan Dekhayser on 7/9/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class ViewController: MasterPage {
    
    
    
    
    @IBOutlet var setupButton: UIButton!
	override func viewDidLoad() {
        
        viewControllerIndex = 0
        
		super.viewDidLoad()
	}
    
    
    @IBAction func setupButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("SecondSegue", sender: self)
    }


}

