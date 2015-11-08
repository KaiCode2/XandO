//
//  BackgroundViewController.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-07.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit
import SpriteKit

final class BackgroundViewController: UIViewController {
    @IBOutlet weak var backgroundView: BackGroundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.showsFPS = true
        backgroundView.showsNodeCount = true
        backgroundView.state = .Red
        print(backgroundView.state)
        print(backgroundView.frame)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //TODO: replace with NSStringFromClass
        let homeVC = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("HomeVC") as UIViewController
        print(view.frame)
        print(homeVC.view.frame)
        
        
        view.addSubview(homeVC.view)
//        addChildViewController(homeVC)
//        presentViewController(homeVC, animated: true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}