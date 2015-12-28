//
//  Player.swift
//  X and O
//
//  Created by Kai Aldag on 2015-12-03.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import Foundation

typealias Position = (Int, Int)

enum PlayerOptions {
    case X
    case O
    case None
    
    mutating func change() {
        switch self {
        case .X: self = .O
        case .O: self = .X
        case .None: break
        }
    }
}

enum PlayError: ErrorType {
    case MoveTaken
}

class Player {
    var board: Board
    let type: PlayerOptions
    
    init(board: Board, type: PlayerOptions) {
        self.board = board
        self.type = type
    }
    
    func makeMove(position: Position) throws {
        if board.currentBoard[position.0][position.1] != .None {
            throw PlayError.MoveTaken
        } else {
            board.currentBoard[position.0][position.1] = type
        }
    }
}

class Players {
    var playerX: Player?
    var playerO: Player?
    
    init(board: Board) {
        self.playerX = Player(board: board, type: .X)
        self.playerO = Player(board: board, type: .O)
    }
}
