//
//  HomeViewController.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-07.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, SettingsViewControllerDelegate {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func presentSettings(sender: AnyObject) {
        let settingsVC = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(NSStringFromClass(SettingsViewController)) as? SettingsViewController
        
        guard (settingsVC != nil) else {
            fatalError("\(NSStringFromClass(SettingsViewController)): is nil, terminating in file: \(self)")
        }
        
        settingsVC?.delegate = self
        
        presentViewController(settingsVC!, animated: true, completion: nil)
    }
    
    func shouldDismissSettings() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
