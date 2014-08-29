//
//  HelpViewController.swift
//  FrostedSidebar
//
//  Created by Al Pascual on 8/22/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit
import LocalAuthentication


class LegacyViewController: MasterPage {

    let touchIDContext = LAContext()
    
    @IBOutlet var save: UIButton!
    @IBOutlet var textLegacy: UITextView!
    override func viewDidLoad() {
        
        viewControllerIndex = 1
        
        super.viewDidLoad()
        
        HUDController.sharedController.contentView = HUDContentView.TextView(text: "Loading...")
        var authError: NSError? = nil
        
        // Request touchID first
        if touchIDContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError)
        {
            touchIDContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Confirm your identity to protect the data of this app", reply: { (success, error) -> Void in
                if ( success) {
                    // Got in
                    println("you are in")
                    self.loadText()
                    HUDController.sharedController.contentView = HUDContentView.TextView(text: "Authenticated")
                }
                else
                {
                    // Don't let them in!
                    println("you are out")
                    HUDController.sharedController.contentView = HUDContentView.TextView(text: "Failed Authentication")
                    self.textLegacy.hidden = true
                    self.save.enabled = false
                }
            })
        }
        else
        {
            // Message: Your device does not have a Touch ID, we can secure this app better by Touch ID
            println("Another kind of authentication")
            HUDController.sharedController.contentView = HUDContentView.TextView(text: "TouchID not found")
        }
        
        //https://github.com/pkluz/PKHUD
        HUDController.sharedController.show()
        HUDController.sharedController.hide(afterDelay: 2.0)
    }
    
    @IBAction func saveText(sender: AnyObject)
    {
        let config = Configuration()
        config.setLegacyText(self.textLegacy!.text)
    }
    
    func loadText()
    {
        let config = Configuration()
        self.textLegacy!.text = config.getLegacyText()
    }
    
    
    
}
