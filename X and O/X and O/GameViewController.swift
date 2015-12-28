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
        boardView.board?.frame = CGRect(x: boardView.frame.origin.x, y: boardView.frame.origin.y, width: boardWidth, height: boardHeight)
        print(boardView.board?.frame)
        print(boardView.frame)
    }
    
    
    // MARK: BoardViewDelegate methods
    
    func didSelectItemInBoard(index: (Int, Int)) {
        switch board.currentMove {
        case .X:
            do {
                try players?.playerX?.makeMove(index)
            } catch {
                
            }
            
        case .O:
            do {
                try players?.playerO?.makeMove(index)
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
    }
}
