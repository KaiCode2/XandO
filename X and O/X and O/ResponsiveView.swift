//
//  ResponsiveView.swift
//  X and O
//
//  Created by Kai Aldag on 2016-01-02.
//  Copyright © 2016 Kai Aldag. All rights reserved.
//

import UIKit
import CoreMotion

extension UIView {
    public var isResponsive: Bool! {
        get{
            if self.isResponsive == nil {
                return false
            }
            return self.isResponsive
        }
        set{
            
        }
    }
    
    private var motionManager: CMMotionManager {
        let motionManager = CMMotionManager()
        guard (motionManager.deviceMotionAvailable == true && isResponsive != false) else {
            return motionManager
        }
        motionManager.gyroUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { [weak self] (motion, error) in
            print(motion?.gravity.x)
            guard (motion != nil) else {
                return
            }
            self?.transform = CGAffineTransformMakeTranslation(CGFloat((motion?.gravity.x)! * 25), CGFloat((motion?.gravity.y)! * 25))
            })
        return motionManager
    }
}
