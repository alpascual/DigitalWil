//
//  ViewController.swift
//  CustomStuff
//
//  Created by Evan Dekhayser on 7/9/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class ViewController: MasterPage {
    
    private var idx: Int = 0
    private let backGroundArray = [UIImage(named: "img1.jpg"),UIImage(named:"img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg")]
    
    @IBOutlet var backGroundImage: UIImageView!
    @IBOutlet var setupButton: UIButton!
	override func viewDidLoad() {
        
        viewControllerIndex = 0
        
		super.viewDidLoad()
        
        // Visual Effect View for background
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark)) as UIVisualEffectView
        visualEffectView.frame = self.view.frame
        visualEffectView.alpha = 0.5
        backGroundImage.image = UIImage(named: "img1.jpg")
        backGroundImage.addSubview(visualEffectView)
        
        NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: "changeImage", userInfo: nil, repeats: true)
        
//        // On Board experience in case they never seen it before
//        let firstPage: OnboardingContentViewController = OnboardingContentViewController(title: "What A Beautiful Photo", body: "This city background image is so beautiful", image: UIImage(named:
//            "blue"), buttonText: "Enable Location Services") {
//        }
//        
//        let secondPage: OnboardingContentViewController = OnboardingContentViewController(title: "I'm So Sorry", body: "I can't get over the nice blurry background photo.", image: UIImage(named:
//            "red"), buttonText: "Connect With Facebook") {
//        }
//        
//        let thirdPage: OnboardingContentViewController = OnboardingContentViewController(title: "Seriously Though", body: "Kudos to the photographer.", image: UIImage(named:
//            "yellow"), buttonText: "Let's Get Started") {
//        }
//        
//        let onboardingVC: OnboardingViewController = OnboardingViewController(backgroundImage: UIImage(named: "street"), contents: [firstPage, secondPage, thirdPage])
//        
//        self.presentViewController(onboardingVC, animated: true, completion: nil)
	}
    
    func changeImage(){
        if idx == backGroundArray.count-1{
            idx = 0
        }
        else{
            idx++
        }
        var toImage = backGroundArray[idx];
        UIView.transitionWithView(self.backGroundImage, duration: 3, options: .TransitionCrossDissolve, animations: {self.backGroundImage.image = toImage}, completion: nil)
        
    }
    
    
    @IBAction func setupButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("SecondSegue", sender: self)
    }


}

