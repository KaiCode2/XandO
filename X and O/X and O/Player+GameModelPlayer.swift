//
//  Player+PlayerModel.swift
//  X and O
//
//  Created by Kai Aldag on 2016-02-23.
//  Copyright © 2016 Kai Aldag. All rights reserved.
//

import GameplayKit

extension Player: GKGameModelPlayer {
    @objc var playerId: Int {
        get{
            switch type {
            case .X: return 0
            case .O: return 1
            default: fatalError("Player.type cannot be None. Terminating.")
            }
        }
    }
}