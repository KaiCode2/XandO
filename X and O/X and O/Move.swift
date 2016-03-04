//
//  Move.swift
//  X and O
//
//  Created by Kai Aldag on 2016-01-27.
//  Copyright © 2016 Kai Aldag. All rights reserved.
//

import Foundation
import GameplayKit


class Move: NSObject, GKGameModelUpdate {
    final var position: Position
    var value: Int = 0
    
    init(position: Position) {
        self.position = position
        super.init()
    }
    
//    static func makeMove() {
//        
//    }
}