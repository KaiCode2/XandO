//
//  Board.swift
//  X and O
//
//  Created by Kai Aldag on 2015-12-03.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import Foundation

protocol BoardDelegate {
    func winner(winner: PlayerOptions)
}

class Board {
    var currentBoard: [[PlayerOptions]] = [[PlayerOptions]](count: 3, repeatedValue: [.None, .None, .None]) {
        didSet{
            moveNumber++
            checkForWinner()
            currentMove.change()
        }
    }
    var currentMove: PlayerOptions = .X
    
    //Used for initial optimization purposes
    private var moveNumber = 0
    
    var delegate: BoardDelegate?
    
    
    // Convert to:
    // private func checkForWinner(index: (Int, Int))
    // this will reduce the amount of checks required and will increase performance
    private func checkForWinner() {
        if delegate == nil {
            print("Delegate is nil therefore you will not be informed if a winner is found.")
        }
        
        if moveNumber < 5 {
            // It is impossible to win within the first 4 moves
            return
        }
        
        if checkVertical(0) || checkVertical(1) || checkVertical(2) || checkHorizontal(0) || checkHorizontal(1) || checkHorizontal(2) || checkDiagonal(true) || checkDiagonal(false) {
            print("WINNER!")
            delegate?.winner(currentMove)
        }
    }
    
    private func checkVertical(collumn: Int) -> Bool {
        if currentBoard[0][collumn] == currentBoard[1][collumn] && currentBoard[1][collumn] == currentBoard[2][collumn] && currentBoard[1][collumn] != .None {
            return true
        }
        return false
    }
    
    private func checkHorizontal(row: Int) -> Bool {
        if currentBoard[row][0] == currentBoard[row][1] && currentBoard[row][1] == currentBoard[row][2] && currentBoard[row][1] != .None {
            return true
        }
        return false
    }
    
    private func checkDiagonal(rightToLeft: Bool) -> Bool {
        if currentBoard[1][1] == .None {
            return false
        }
        
        switch rightToLeft {
        case true:
            if currentBoard[0][0] == currentBoard[1][1] && currentBoard[1][1] == currentBoard[2][2]{
                return true
            }
        case false:
            if currentBoard[0][2] == currentBoard[1][1] && currentBoard[0][2] == currentBoard[1][1] {
                return true
            }
        }
        return false
    }
    
    //MARK: inits
    
    init(delegate: BoardDelegate? = nil) {
        self.delegate = delegate
    }
}
