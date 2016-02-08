//
//  Game.swift
//  X and O
//
//  Created by Kai Aldag on 2016-01-27.
//  Copyright © 2016 Kai Aldag. All rights reserved.
//

import Foundation
import GameplayKit

extension Board: GKGameModel {
    
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
    
    @objc func gameModelUpdatesForPlayer(player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
        return availibleMoves.map() { Move(position: $0) }
    }
    
    @objc func setGameModel(gameModel: GKGameModel) {
        if let board = gameModel as? Board {
            updateMovesFromBoard(board)
        }
    }
    
    @objc func applyGameModelUpdate(gameModelUpdate: GKGameModelUpdate) {
        if let update = gameModelUpdate as? Move {
            print(update.position)
            do {
                try currentPlayer.makeMove(update.position)
            } catch {
                
            }
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        // TODO: implement this
        return 1
    }
}
