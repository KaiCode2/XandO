//
//  SettingsViewController.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-14.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func shouldDismissSettings()
}

final class SettingsViewController: UIViewController, UITableViewDataSource {
    @IBOutlet private weak var generalSettingsTableView: UITableView!
    @IBOutlet private weak var aboutTableView: UITableView!
    
    @IBOutlet weak var versionLabel: UILabel!
    var delegate: SettingsViewControllerDelegate?
    
    private struct constants {
        private static let generalReuseID = "GeneralCellID"
        private static let aboutReuseID = "AboutCellID"
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: set versionLabel text to current build
        
        generalSettingsTableView.dataSource = self
        aboutTableView.dataSource = self
        
        generalSettingsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: constants.generalReuseID)
        aboutTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: constants.aboutReuseID)
    }
    
    // MARK: Dismissal
    
    @IBAction func dismissSettings(sender: AnyObject) {
        delegate?.shouldDismissSettings()
    }
    
    // MARK: UITableViewDataSource methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case generalSettingsTableView: return 4
        case aboutTableView: return 2
        default: fatalError("Unknown table view (\(tableView)) in file: \(self)")
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch tableView {
        case generalSettingsTableView:
            if let cell = tableView.dequeueReusableCellWithIdentifier(constants.generalReuseID) {
                cell.backgroundColor = .darkGrayColor()
                cell.textLabel?.textColor = .whiteColor()
                switch indexPath.item {
                case 0: cell.textLabel?.text = "Colours"
                case 1: cell.textLabel?.text = "Game Settings"
                case 2: cell.textLabel?.text = "Help"
                case 3: cell.textLabel?.text = "Language"
                default: break
                }
                return cell
            } else {
                fatalError("Cell in: \(self) could not properly be dequeued. Termanating")
            }
        case aboutTableView:
            if let cell = tableView.dequeueReusableCellWithIdentifier(constants.aboutReuseID) {
                cell.backgroundColor = .darkGrayColor()
                cell.textLabel?.textColor = .whiteColor()
                switch indexPath.item {
                case 0: cell.textLabel?.text = "About Us"
                case 1: cell.textLabel?.text = "Contact"
                default: break
                }
                return cell
            } else {
                fatalError("Cell in: \(self) could not properly be dequeued. Termanating")
            }
        default: fatalError("Unknown table view (\(tableView)) in file: \(self)")
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}