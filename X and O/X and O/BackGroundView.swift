//
//  BackGroundView.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-05.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import SpriteKit

class BackGroundView: SKView {
    private class BackgroundScenes {
        class var HomeScene: SKScene {
            //TODO: make an SKScene that transitions between red and blue
            return SKScene()
        }
        
        class var BlueScene: SKScene {
            let path = NSBundle.mainBundle().pathForResource("BlueBackgroundParticle", ofType: "sks")
            
            guard (path != nil) else { fatalError("file: BlueBackgroundParticle.sks was not found by \(self), aborting!") }
            
            let emmiterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKNode
            
            let blueScene = SKScene()
            blueScene.addChild(emmiterNode)
            blueScene.scaleMode = .AspectFit
            
            return blueScene
        }
        
        class var RedScene: SKScene {
            let path = NSBundle.mainBundle().pathForResource("RedBackgroundParticle", ofType: "sks")
            
            guard (path != nil) else { fatalError("file: RedBackgroundParticle.sks was not found by \(self), aborting!") }
            
            let emmiterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKNode
            
            let redScene = SKScene()
            redScene.addChild(emmiterNode)
            redScene.scaleMode = .AspectFit
            
            return redScene
        }
    }
    
    enum State {
        case Home
        
        case Blue
        case Red
        
        mutating func switchState() {
            switch self {
            case .Blue: self = .Red
            case .Red: self = .Blue
            case .Home: self = .Blue
            }
        }
    }
    
    private var _state = State.Home
    
    var state: State {
        get {
            return _state
        }
        
        set(newValue) {
            switch newValue {
            case .Home:
                _state = newValue
                return
            case .Blue:
                _state = newValue
                self.presentScene(BackgroundScenes.BlueScene)
            case .Red:
                _state = newValue
                self.presentScene(BackgroundScenes.RedScene)
            }
        }
    }
    
}
