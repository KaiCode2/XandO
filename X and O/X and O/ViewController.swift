//
//  ViewController.swift
//  X and O
//
//  Created by Kai Aldag on 2015-10-28.
//  Copyright © 2015 Kai Aldag. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var particleView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("BlueBackgroundParticle", ofType: "sks")
        let emmiterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKNode
        print(emmiterNode.frame)
        
        let bluleScene = SKScene(size: CGSize(width: 1000, height: 1000))
        bluleScene.addChild(emmiterNode)
        bluleScene.scaleMode = .AspectFit
        
        print(bluleScene.frame)
        
        particleView.showsFPS = true
        particleView.showsNodeCount = true
        particleView.presentScene(bluleScene)
        print(particleView.frame)
    }
}

