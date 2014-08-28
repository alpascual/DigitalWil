//
//  ViewController.swift
//  CustomStuff
//
//  Created by Evan Dekhayser on 7/9/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: MasterPage {
    
    
    let touchIDContext = LAContext()
    
	override func viewDidLoad() {
        
        viewControllerIndex = 0
        
		super.viewDidLoad()
        
        var authError: NSError? = nil
        
        // Request touchID first 
        if touchIDContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError)
        {
            touchIDContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Confirm your identity to protect the data of this app", reply: { (success, error) -> Void in
                if ( success) {
                    // Got in
                    println("you are in")
                }
                else
                {
                    // Don't let them in!
                    println("you are out")
                }
            })
        }
        else
        {
            // Message: Your device does not have a Touch ID, we can secure this app better by Touch ID
            println("Another kind of authentication")
        }
        
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

