//
//  BoardView.swift
//  X and O
//
//  Created by Kai Aldag on 2015-12-25.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit

protocol BoardViewDelegate {
    func didSelectItemInBoard(index: (Int, Int))
}

class BoardView: UIView {
    weak var board: UIView?
    
    var delegate: BoardViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let kNibName = "BoardView"
        if let view = NSBundle.mainBundle().loadNibNamed(kNibName, owner: self, options: nil).first {
            board = view as? UIView
            self.addSubview(board!)
            
            // TODO: add lines here
        } else {
            fatalError("BoardView.xib could not succesfully be loaded, aborting!")
        }
    }
    
    // MARK: Line method
    
    private func makeLine(start: (Int, Int), end: (Int, Int)) {
        // TODO: implement this
    }
    
    // MARK: Movement methods
    
    func shake() {
        // TODO: make the board shake
    }
    
    
    // MARK: button methods
    // TODO: refactor the below into one IBAction
    
    @IBAction func button1tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((0, 0))
    }
    
    @IBAction func button2tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((0, 1))
    }
    
    @IBAction func button3tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((0, 2))
    }
    
    @IBAction func button4tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((1, 0))
    }
    
    @IBAction func button5tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((1, 1))
    }
    
    @IBAction func button6tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((1, 2))
    }
    
    @IBAction func button7tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((2, 0))
    }
    
    @IBAction func button8tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((2, 1))
    }
    
    @IBAction func button9tapped(sender: AnyObject) {
        delegate?.didSelectItemInBoard((2, 2))
    }
}
