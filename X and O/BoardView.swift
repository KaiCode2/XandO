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

final class BoardView: UIView {
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
    
    
    // MARK: button method
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if let t = sender.tag {
            switch t {
            case 0: delegate?.didSelectItemInBoard((0, 0)) ; print("0.0")
            case 1: delegate?.didSelectItemInBoard((0, 1)) ; print("0.1")
            case 2: delegate?.didSelectItemInBoard((0, 2)) ; print("0.2")
            case 3: delegate?.didSelectItemInBoard((1, 0)) ; print("1.0")
            case 4: delegate?.didSelectItemInBoard((1, 1)) ; print("1.1")
            case 5: delegate?.didSelectItemInBoard((1, 2)) ; print("1.2")
            case 6: delegate?.didSelectItemInBoard((2, 0)) ; print("2.0")
            case 7: delegate?.didSelectItemInBoard((2, 1)) ; print("2.1")
            case 8: delegate?.didSelectItemInBoard((2, 2)) ; print("2.2")
            default: fatalError("Should not end up here")
            }
        }
    }
}
