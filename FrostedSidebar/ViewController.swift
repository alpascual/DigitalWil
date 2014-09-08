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

