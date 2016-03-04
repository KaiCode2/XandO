//
//  Game.swift
//  X and O
//
//  Created by Kai Aldag on 2016-01-27.
//  Copyright © 2016 Kai Aldag. All rights reserved.
//

import Foundation
import GameplayKit

extension Board: GKGameModel, NSCopying {
    
    // MARK: Minmax: Players
    
    var currentPlayer: Player {
        get{
            switch currentMove {
            case .X: return _players.playerX
            case .O: return _players.playerO
            default: fatalError("Current player cannot be None.")
            }
        }
    }
    
    private var _players: Players {
        get{
            return Players(board: self)
        }
    }
    
    @objc var players: [GKGameModelPlayer]? {
        get{
            return Players(board: self).all()
        }
    }
    
    @objc var activePlayer: GKGameModelPlayer? {
        get{
            return currentPlayer
        }
    }
    
    
    // MARK: Minmax: Evaluate
    
    @objc func gameModelUpdatesForPlayer(player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
        return availibleMoves.map() { Move(position: $0) }
    }
    
    @objc func scoreForPlayer(player: GKGameModelPlayer) -> Int {
        
        /*
        Heuristic: The way a player's score is calculated is to sum of all the :
        
        The list of how valuable certain moves are is listed below along with the weight/significans of the move.
        1: Immediate victory possible (Move weight: 10000)
            If there is a pre-existing line of 2 and the next space is availible the AI shall take that move to secure a win.
        2: Block possible opponent victory (Move weight: 1000)
            If opponent is 1 move away from a win AI shall counter to secure its safety.
        3: Expand line segment (Move weight: 25)
            If there is an unobstructed path that can be expanded upon and can in turn lead to a victory the AI shall value that move very highly.
        4: Block opponent line segment (Move weight: 20)
            If opponent has the potential to create valueable line segments the AI shall value a counter move highly.
        5: Winabillity (Move weight: 5N where N = potential wins)
            Certain positions have more ways in which they can form potential wins. The AI shall consider more versatile moves more valuable.
        
        
        */
        
        
        var score = 0
        
        
        return score
    }
    
    @objc func isWinForPlayer(player: GKGameModelPlayer) -> Bool {
        if let gamePlayer = player as? Player {
            let winner = checkForWinner()
            
            if winner.1 != nil && winner.1 == gamePlayer {
                return true
            }
        }
        
        return false
    }
    
    @objc func isLossForPlayer(player: GKGameModelPlayer) -> Bool {
        if let gamePlayer = player as? Player {
            let winner = checkForWinner()
            
            if winner.1 != nil && winner.1 != gamePlayer {
                return true
            }
        }
        
        return false
    }
    
    // MARK: Minmax: Apply Moves
    
    @objc func applyGameModelUpdate(gameModelUpdate: GKGameModelUpdate) {
        if let update = gameModelUpdate as? Move {
            print(update.position)
            do {
                try currentPlayer.makeMove(update.position)
            } catch {
                
            }
        }
    }
    
    
    // MARK: Minmax: Copying Board State
    
    @objc func setGameModel(gameModel: GKGameModel) {
        if let board = gameModel as? Board {
            updateMovesFromBoard(board)
        }
    }
    
    public func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = Board(delegate: self.delegate)
        copy.setGameModel(self)
        return copy
    }
}
