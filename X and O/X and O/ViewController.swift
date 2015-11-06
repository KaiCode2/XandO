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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let path = NSBundle.mainBundle().pathForResource("BackgroundParticle", ofType: "sks")
        let emmiterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKNode
        print(emmiterNode.frame)
        
        let scene = SKScene(size: CGSize(width: view.frame.width / 2, height: view.frame.height / 2))
        scene.addChild(emmiterNode)
        scene.scaleMode = .AspectFit
        print(scene.frame)
        
        particleView.presentScene(scene)
        print(particleView.frame)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

