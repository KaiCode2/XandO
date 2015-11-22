//
//  HomeViewController.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-07.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit
import SpriteKit

final class HomeViewController: UIViewController, SettingsViewControllerDelegate {
    
    @IBOutlet weak var backgroundView: BackgroundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.showsFPS = true
        backgroundView.showsNodeCount = true
        backgroundView.state = .Home
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    //MARK: Button events
    
    @IBAction func presentSingleGame(sender: AnyObject) {
        
    }
    
    @IBAction func presentDualGame(sender: AnyObject) {
        
    }
    
    @IBAction func presentSettings(sender: AnyObject) {
        let settingsVC = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(NSStringFromClass(SettingsViewController)) as? SettingsViewController
        
        guard (settingsVC != nil) else {
            fatalError("\(NSStringFromClass(SettingsViewController)): is nil, terminating in file: \(self)")
        }
        
        settingsVC?.delegate = self
        
        presentViewController(settingsVC!, animated: true, completion: nil)
    }
    
    //MARK: SettingsViewControllerDelegate methods
    
    func shouldDismissSettings() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
