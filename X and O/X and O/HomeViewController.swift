//
//  HomeViewController.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-07.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit
import SpriteKit

protocol PresenterType {
    func shouldDismiss()
}

@available(iOS 9.0, *)
final class HomeViewController: UIViewController, PresenterType {
    
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
        let gameVC = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(NSStringFromClass(GameViewController)) as? GameViewController
        
        guard (gameVC != nil) else {
            fatalError("\(NSStringFromClass(GameViewController)): is nil, terminating in file: \(self)")
        }
        
        gameVC?.isSinglePlayer = true
        gameVC?.presenter = self
        
        presentViewController(gameVC!, animated: true, completion: nil)
    }
    
    @IBAction func presentDualGame(sender: AnyObject) {
        let gameVC = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(NSStringFromClass(GameViewController)) as? GameViewController
        
        guard (gameVC != nil) else {
            fatalError("\(NSStringFromClass(GameViewController)): is nil, terminating in file: \(self)")
        }
        
        gameVC?.presenter = self
        
        presentViewController(gameVC!, animated: true, completion: nil)
    }
    
    @IBAction func presentSettings(sender: AnyObject) {
        let settingsVC = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(NSStringFromClass(SettingsViewController)) as? SettingsViewController
        
        guard (settingsVC != nil) else {
            fatalError("\(NSStringFromClass(SettingsViewController)): is nil, terminating in file: \(self)")
        }
        
        settingsVC?.presenter = self
        
        presentViewController(settingsVC!, animated: true, completion: nil)
    }
    
    //MARK: PresenterType methods
    
    func shouldDismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
