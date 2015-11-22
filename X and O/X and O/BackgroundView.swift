//
//  BackGroundView.swift
//  X and O
//
//  Created by Kai Aldag on 2015-11-05.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import SpriteKit

final class BackgroundView: SKView {
    var visualView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addSubview(visualView)
    }
    
    private class BackgroundScenes {
        class var HomeScene: SKScene {
            let path = NSBundle.mainBundle().pathForResource("HomeBackgroundParticle", ofType: "sks")
            
            guard (path != nil) else {
                fatalError("file: HomeBackgroundParticle.sks was not found by \(self), aborting!")
            }
            
            let emmiterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKNode
            
            let homeScene = SKScene(size: CGSize(width: 150, height: 240))
            homeScene.addChild(emmiterNode)
            homeScene.scaleMode = .AspectFit
            return homeScene
        }
        
        class var BlueScene: SKScene {
            let path = NSBundle.mainBundle().pathForResource("BlueBackgroundParticle", ofType: "sks")
            
            guard (path != nil) else {
                fatalError("file: BlueBackgroundParticle.sks was not found by \(self), aborting!")
            }
            
            let emmiterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKNode
            
            let blueScene = SKScene(size: CGSize(width: 150, height: 250))
            blueScene.addChild(emmiterNode)
            blueScene.scaleMode = .AspectFit
            return blueScene
        }
        
        class var RedScene: SKScene {
            let path = NSBundle.mainBundle().pathForResource("RedBackgroundParticle", ofType: "sks")
            
            guard (path != nil) else {
                fatalError("file: RedBackgroundParticle.sks was not found by \(self), aborting!")
            }
            
            let emmiterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKNode
            
            let redScene = SKScene(size: CGSize(width: 150, height: 250))
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
    
    private var _state = State.Red
    
    var state: State {
        get {
            return _state
        }
        
        set(newValue) {
            switch newValue {
            case .Home:
                _state = newValue
                self.presentScene(BackgroundScenes.HomeScene)
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
