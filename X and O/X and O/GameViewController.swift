//
//  GameViewController.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-21.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewDelegate, BoardDelegate {
    @IBOutlet weak var backgroundView: BackgroundView!
    @IBOutlet weak var boardView: BoardView!
    
    private var board: Board!
    private var players: Players?
    
    var presenter: protocol<PresenterType>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // board setup
        board = Board(delegate: self)
        players = Players(board: board)
        
        // backgroundView setup
        backgroundView.showsFPS = true
        backgroundView.showsNodeCount = true
        backgroundView.state = .Red
        
        // boardView setup
        boardView.delegate = self
        
        // TODO: fix the sizing being done on the board
        let boardWidth = boardView.frame.width
        let boardHeight = boardView.frame.height
        boardView.board?.frame = CGRect(x: boardView.frame.origin.x - 50, y: boardView.frame.origin.y - 50, width: boardWidth, height: boardHeight)
        print(boardView.board?.frame)
        print(boardView.frame)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    // MARK: BoardViewDelegate methods
    
    func didSelectItemInBoard(index: (Int, Int)) {
        switch board.currentMove {
        case .X:
            do {
                try players?.playerX?.makeMove(index)
                boardView.addMove(index, type: .X)
            } catch {
                
            }
            
        case .O:
            do {
                try players?.playerO?.makeMove(index)
                boardView.addMove(index, type: .O)
            } catch {
                
            }
            
        default:
            fatalError("there can be no None player")
        }
        backgroundView.state.switchState()
    }
    
    // MARK: BoardDelegate methods
    
    func winner(winner: PlayerOptions) {
        let winnerAlert = UIAlertView(title: "Winner!", message: "\(winner) won!", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "OK")
        winnerAlert.show()
        boardView.userInteractionEnabled = false
        backgroundView.state = .Home
    }
    
    // MARK: Back button
    
    @IBAction func dismissGame(sender: AnyObject) {
        if let pres = presenter {
            pres.shouldDismiss()
        }
    }
}
