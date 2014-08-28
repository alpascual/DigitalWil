//
//  ViewController.swift
//  CustomStuff
//
//  Created by Evan Dekhayser on 7/9/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class ViewController: MasterPage {
    
    
    
    
	override func viewDidLoad() {
        
        viewControllerIndex = 0
        
		super.viewDidLoad()
        
        
        
	}
    
    /*
LAContext *myContext = [[LAContext alloc] init];
NSError *authError = nil;
NSString *myLocalizedReasonString = <#String explaining why app needs authentication#>;

if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
[myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
localizedReason:myLocalizedReasonString
reply:^(BOOL success, NSError *error) {
if (success) {
// User authenticated successfully, take appropriate action
} else {
// User did not authenticate successfully, look at error and take appropriate action
}
}];
} else {
// Could not evaluate policy; look at authError and present an appropriate message to user
}*/



}

